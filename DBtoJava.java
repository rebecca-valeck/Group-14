import java.sql.*;
import java.util.ArrayList;

class DBtoJava{
    
    public void main(String[] args){
        int columnNum = 1999;
        //String code = "";
        //String condition = "FROM flights WHERE flight_id = ";
        String str = null;
        int intg = 0;

        try(Connection conn = DriverManager.getConnection("jdbc:sqlite:database.db")){
            Statement stmt = conn.createStatement();
            String code = "SELECT date FROM flights WHERE flight_id > 1997";
            ResultSet rs = stmt.executeQuery(code);
            System.out.println(rs);


            
            
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
}