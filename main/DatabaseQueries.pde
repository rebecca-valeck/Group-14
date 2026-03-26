import java.sql.*;
public class DatabaseQueries {
    String dbPath = "database.db";


    public ArrayList<ArrayList<String>> query(String query){
        ArrayList<ArrayList<String>> queryResultArray = new ArrayList<>(0);
            try{
                Class.forName("org.sqlite.JDBC");
                Connection conn = DriverManager.getConnection("jdbc:sqlite:"+dbPath);
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                int numberOfFields = rs.getMetaData().getColumnCount() + 1;
                while (rs.next()){
                    ArrayList<String> queryResultSubarray = new ArrayList<>(0);
                    for (int i = 1; i < numberOfFields;i++){
                        queryResultSubarray.add(rs.getString(i)) ;
                    }
                queryResultArray.add(queryResultSubarray);
                }

                return queryResultArray;      
        }catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
            return (queryResultArray);
        }
    }

    public ArrayList<ArrayList<Integer>> IntegerQuery(String query){
        ArrayList<ArrayList<Integer>> queryResultArray = new ArrayList<>(0);
        try(Connection conn = DriverManager.getConnection("jdbc:sqlite:database.db")){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            int numberOfFields = rs.getMetaData().getColumnCount() + 1;
            while (rs.next()){
                ArrayList<Integer> queryResultSubarray = new ArrayList<>(0);
                for (int i = 1; i < numberOfFields;i++){
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
    public ArrayList<ArrayList<String>> filteredQuery(ArrayList<Checkbox> origins){
            String queryString = "SELECT DEST, COUNT(*) FROM flights ";
            String filteredAirports = "(";
            String originBuffer = "";
            for(int i = 0; i < origins.size() -1; i++){
                if (origins.get(i).checked){
                    if (originBuffer != "") filteredAirports += "ORIGIN = \"" +originBuffer +"\" OR ";
                    originBuffer =  origins.get(i).label;
                } 
            }
            filteredAirports += "ORIGIN = \"" +originBuffer +"\")";

            queryString+= "WHERE" + filteredAirports;

            queryString +=" GROUP BY DEST ORDER BY COUNT(*)";
            // "DESC LIMIT " +  (int)((w - 50) /  gap);
            return db.query(queryString);

    }



}
