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
                                                        String date,
                                                        String distance,
                                                        String arrivalTime,
                                                        String departureTime,
                                                        float w,float gap,String groupBy,String baseQueryString){
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
                queryString += "WHERE " + filteredOrigins; 
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
                queryString += (queryString != baseQueryString?" AND ":"WHERE ") + filteredDestinations; 
            }

            if(!date.equals("DayMonth"))queryString += (queryString != baseQueryString?" AND ":"WHERE ") + "(date = \"" + date + "\")";
            if(distance != "Distance")queryString += (queryString != baseQueryString?" AND ":"WHERE ") + "(DISTANCE = \"" + distance + "\")";
            if(departureTime != "Departure time")queryString += (queryString != baseQueryString?" AND ":"WHERE ") + "(DEPT_TIME = \"" + departureTime + "\")";
            if(arrivalTime != "Arrival time")queryString += (queryString != baseQueryString?" AND ":"WHERE ") + "(ARR_TIME = \"" + arrivalTime + "\")";
            println(queryString);
            println(db.query(queryString));


            queryString +=" GROUP BY " +groupBy +" ORDER BY COUNT(*)"
            + " DESC LIMIT " +  (int)((w - 50) /  gap);
            return db.query(queryString);
    }

}
