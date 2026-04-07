import java.sql.*;
public class DatabaseQueries 
{
    String dbPath = "database.db";

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



            queryString += endQueryString;
            print(queryString);
            return db.query(queryString);
    }



}
