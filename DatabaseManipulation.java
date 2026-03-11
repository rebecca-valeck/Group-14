import java.sql.*;

public class DatabaseManipulation {
    public static void main(String[] args) {
       clearDatabase(); 
    }
    public static void clearDatabase() {

        String url = "jdbc:sqlite:database.db";
        String sql = "DELETE FROM flights";

        try (Connection conn = DriverManager.getConnection(url);
            Statement stmt = conn.createStatement()) {

            int rowsDeleted = stmt.executeUpdate(sql);
            System.out.println(rowsDeleted + " rows deleted.");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
