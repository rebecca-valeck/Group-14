import java.util.ArrayList;

class DBtoJava{

    public ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<String>>>>>>>> strFlightsToArrayList(){
        ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<String>>>>>>>> list = new ArrayList<String>();
        String query = "";

        // date
        for (int i = 0; i < 1999; i++){
            query = "SELECT date FROM flights WHERE flight_id = " + i + ";";
            list.set(i) = query(query).get(1);
            System.out.println(query(query).get(1));
        }

        // MKT_CARRIER
        for (int i = 0; i < 1999; i++){
        query = "SELECT MKT_CARRIER FROM flights WHERE flight_id = " + i + ";";
            list.set(i) = query(query).get(1);
            System.out.println(query(query).get(1));
        }

        // ORIGIN
        for (int i = 0; i < 1999; i++){
            query = "SELECT ORIGIN FROM flights WHERE flight_id = " + i + ";";
            list.set(i) = query(query).get(1);
            System.out.println(query(query).get(1));
        }

        // ORIGIN_CITY_NAME
        for (int i = 0; i < 1999; i++){
            query = "SELECT ORIGIN_CITY_NAME FROM flights WHERE flight_id = " + i + ";";
            list.set(i) = query(query).get(1);
            System.out.println(query(query).get(1));
        }

        // ORIGIN_STATE_ABR
        for (int i = 0; i < 1999; i++){
            query = "SELECT ORIGIN_STATE_ABR FROM flights WHERE flight_id = " + i + ";";
            list.set(i) = query(query).get(1);
            System.out.println(query(query).get(1));
        }

        // DEST
        for (int i = 0; i < 1999; i++){
            query = "SELECT DEST FROM flights WHERE flight_id = " + i + ";";
            list.set(i) = query(query).get(1);
            System.out.println(query(query).get(1));
        }

        // DEST_CITY_NAME
        for (int i = 0; i < 1999; i++){
            query = "SELECT DEST_CITY_NAME FROM flights WHERE flight_id = " + i + ";";
            list.set(i) = query(query).get(1);
            System.out.println(query(query).get(1));
        }

        // DEST_STATE_ABR
        for (int i = 0; i < 1999; i++){
            query = "SELECT DEST_STATE_ABR FROM flights WHERE flight_id = " + i + ";";
            list.set(i) = query(query).get(1);
            System.out.println(query(query).get(1));
        }
        
        return list;
    }
    
    /*
    public void main(String[] args){
        //int columnNum = 1999;
        //String code = "";
        //String condition = "FROM flights WHERE flight_id = ";
        //String str = null;
        //int intg = 0;

        try(Connection conn = DriverManager.getConnection("jdbc:sqlite:database.db")){
            Statement stmt = conn.createStatement();
            String code = "SELECT date FROM flights WHERE flight_id > 1997";
            ResultSet rs = stmt.executeQuery(code);
            System.out.println(rs);


            
            
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    */
}