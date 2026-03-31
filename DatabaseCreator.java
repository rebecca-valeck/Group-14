import java.io.*;
import java.sql.*;
public class DatabaseCreator{
    public static void main(String args[]){
        createDatabase();
    }
     
    static void createDatabase(){
        try {
            try (Connection conn = DriverManager.getConnection("jdbc:sqlite:database.db")) {

                String createTable = "CREATE TABLE IF NOT EXISTS flights (flight_id INT, date TEXT, MKT_CARRIER TEXT, MKT_CARRIER_FL_NUM INT, ORIGIN TEXT, ORIGIN_CITY_NAME TEXT , ORIGIN_STATE_ABR TEXT, ORIGIN_WAC INT , DEST TEXT,DEST_CITY_NAME TEXT , DEST_STATE_ABR TEXT, DEST_WAC INT , CRS_DEPT_TIME INT, DEPT_TIME INT, CRS_ARR_TIME INT, ARR_TIME INT, CANCELLED INT, DIVERTED INT, DISTANCE INT)";
                Statement stmt = conn.createStatement();
                stmt.execute(createTable);
                
                BufferedReader br;
                br = new BufferedReader(new FileReader("flights100k.csv"));
                
                String line;
                br.readLine(); // skip header
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
                }
                pstmt.executeUpdate();
                br.close();
                
                System.out.println("CSV imported successfully!");
            }

        } catch (IOException | NumberFormatException | SQLException e) {
            e.printStackTrace();
        }
    }

}