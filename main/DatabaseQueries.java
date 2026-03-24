import java.sql.*;
import java.util.ArrayList;
public class DatabaseQueries {
    public static String dbPath = "database.db";


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
    

}
