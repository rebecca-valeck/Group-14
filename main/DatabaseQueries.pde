import java.sql.*;
import java.io.*;

public class DatabaseQueries 
{
    String dbPath = "database.db";
    void createDatabase(){
        try {
            try (Connection conn = DriverManager.getConnection("jdbc:sqlite:"+dbPath)) {

                String createTable = "CREATE TABLE IF NOT EXISTS flights (flight_id INT, date TEXT, MKT_CARRIER TEXT, MKT_CARRIER_FL_NUM INT, ORIGIN TEXT, ORIGIN_CITY_NAME TEXT , ORIGIN_STATE_ABR TEXT, ORIGIN_WAC INT , DEST TEXT,DEST_CITY_NAME TEXT , DEST_STATE_ABR TEXT, DEST_WAC INT , CRS_DEPT_TIME INT, DEPT_TIME INT, CRS_ARR_TIME INT, ARR_TIME INT, CANCELLED INT, DIVERTED INT, DISTANCE INT)";
                Statement stmt = conn.createStatement();
                stmt.execute(createTable);
                
                BufferedReader br;
                br = new BufferedReader(new FileReader("/home/george/Desktop/Group-14/main/flights100k.csv"));
                
                String line;
                br.readLine(); //reads one line and does nothing to skip header
                String sql = "INSERT INTO flights (flight_id,date, MKT_CARRIER, MKT_CARRIER_FL_NUM, ORIGIN, ORIGIN_CITY_NAME, ORIGIN_STATE_ABR, ORIGIN_WAC, DEST, DEST_CITY_NAME, DEST_STATE_ABR, DEST_WAC, CRS_DEPT_TIME, DEPT_TIME, CRS_ARR_TIME, ARR_TIME, CANCELLED, DIVERTED, DISTANCE) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
                PreparedStatement pstmt = conn.prepareStatement(sql);
                
                int count = 0;
                while ((line = br.readLine()) != null) {

                    String[] values = line.split(",(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)");
                    pstmt.setInt(1, count);
                    count++;
                    for(int i = 0; i < 18; i++){

                        String value = values[i].replace("\"","");


                        if(i == 4 || i == 8){
                            if(value.contains(",")){
                                value = value.split(",")[0];
                            }
                        }

                        try{
                            pstmt.setInt(i+2, Integer.parseInt(value));
                        }
                        catch(NumberFormatException e){
                            pstmt.setString(i+2, value);
                        }
                    }
                        pstmt.addBatch();
                        if (count % 1000 == 0) {
                            pstmt.executeBatch(); // ony executes every 1000 to speed up program
                            System.out.println(count / 1000);
                        }
                }
                pstmt.executeBatch();
                br.close();
                
                System.out.println("CSV imported successfully!");
            }

        } catch (IOException | NumberFormatException | SQLException e) {
            e.printStackTrace();
        }
    }


    public void clearDatabase() {


        String sql = "DELETE FROM flights";

        try (Connection conn = DriverManager.getConnection("jdbc:sqlite:"+dbPath);
            Statement stmt = conn.createStatement()) {

            int rowsDeleted = stmt.executeUpdate(sql);
            System.out.println(rowsDeleted + " rows deleted.");

        } catch (SQLException e) {
        }
    }
    public ArrayList<ArrayList<String>> query(String query)
    {
        ArrayList<ArrayList<String>> queryResultArray = new ArrayList<>(0);
            try
            {
                Class.forName("org.sqlite.JDBC");
                Connection conn = DriverManager.getConnection("jdbc:sqlite:"+dbPath);
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                int numberOfFields = rs.getMetaData().getColumnCount() + 1;
                while (rs.next())
                {
                    ArrayList<String> queryResultSubarray = new ArrayList<>(0);
                    for (int i = 1; i < numberOfFields;i++)
                    {
                        queryResultSubarray.add(rs.getString(i)) ;
                    }
                    queryResultArray.add(queryResultSubarray);
                }

                return queryResultArray;      
        }catch(Exception e)
        { 
            print("error");
            e.printStackTrace();
            return (queryResultArray);
        }
    }

    public ArrayList<ArrayList<Integer>> IntegerQuery(String query)
    {
        ArrayList<ArrayList<Integer>> queryResultArray = new ArrayList<>(0);
        try(Connection conn = DriverManager.getConnection("jdbc:sqlite:database.db"))
        {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            int numberOfFields = rs.getMetaData().getColumnCount() + 1;
            while (rs.next())
            {
                ArrayList<Integer> queryResultSubarray = new ArrayList<>(0);
                for (int i = 1; i < numberOfFields;i++)
                {
                    queryResultSubarray.add(rs.getInt(i)) ;
                }
               queryResultArray.add(queryResultSubarray);
            }

            return queryResultArray;
            
        }catch(SQLException e){
            e.printStackTrace();
            return (queryResultArray);
        }
    }
    public ArrayList<ArrayList<String>> filteredQuery(  ArrayList<Checkbox> origins,
                                                        ArrayList<Checkbox> destinations,
                                                        ArrayList<String> dates,
                                                        String distance,
                                                        String arrivalTime,
                                                        String departureTime,
                                                        String lateness,
                                                        String baseQueryString,
                                                        String endQueryString){
            String queryString = baseQueryString;

            String buffer = "";       
            String filteredOrigins = "(";
            for(int i = 0; i < origins.size() -1; i++)
            {
                if (origins.get(i).checked)
                {
                    if (buffer != "") filteredOrigins += "ORIGIN_CITY_NAME" + "= \"" +buffer +"\" OR ";
                    buffer =  origins.get(i).label;
                } 
            }
            if (buffer != "")
            {
                filteredOrigins += "ORIGIN_CITY_NAME" +"= \"" +buffer +"\")";
                queryString += filteredOrigins; 
            }
            String filteredDestinations = "(";
            buffer = "";
            for(int i = 0; i < destinations.size() -1; i++)
            {
                if (destinations.get(i).checked)
                {
                    if (buffer != "") filteredDestinations += "DEST_CITY_NAME" + "= \"" +buffer +"\" OR ";
                    buffer =  destinations.get(i).label;
                } 
            }
            if (buffer != "")
            {
                filteredDestinations +="DEST_CITY_NAME" +"= \"" +buffer +"\")";
                queryString += (queryString != baseQueryString?" AND ":"") + filteredDestinations; 
            }

            if (dates.size()>0){
                String allDates = "date = \"" + dates.get(0) + "\"";
                for (int index = 1; index < dates.size(); index++) allDates += " OR date = \"" + dates.get(index) + "\"";
                queryString += (queryString != baseQueryString?" AND ":"") + "( " + allDates +" )";
            }
            if(distance != "Distance")queryString += (queryString != baseQueryString?" AND ":"") + "(DISTANCE = \"" + distance + "\")";
            if(departureTime != "Departure time")queryString += (queryString != baseQueryString?" AND ":"") + "(DEPT_TIME = \"" + departureTime + "\")";
            if(arrivalTime != "Arrival time")queryString += (queryString != baseQueryString?" AND ":"") + "(ARR_TIME = \"" + arrivalTime + "\")";
            if(lateness != "Lateness")queryString += (queryString != baseQueryString?" AND ":"") + "(ARR_TIME - CRS_ARR_TIME > " + lateness + ")";



            queryString += endQueryString;
            print(queryString);
            return db.query(queryString);
    }



}
