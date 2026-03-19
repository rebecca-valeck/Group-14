import java.util.ArrayList;
import java.lang.Integer;

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
            list.get(i).get(0).get(0).get(0).get(0).get(0).get(0).set(query(query).get(1));
            System.out.println(query(query).get(1));
        }

        // ORIGIN
        for (int i = 0; i < 1999; i++){
            query = "SELECT ORIGIN FROM flights WHERE flight_id = " + i + ";";
            list.get(0).get(i).get(0).get(0).get(0).get(0).get(0).set(query(query).get(1));
            System.out.println(query(query).get(1));
        }

        // ORIGIN_CITY_NAME
        for (int i = 0; i < 1999; i++){
            query = "SELECT ORIGIN_CITY_NAME FROM flights WHERE flight_id = " + i + ";";
            list.get(0).get(0).get(i).get(0).get(0).get(0).get(0).set(query(query).get(1));
            System.out.println(query(query).get(1));
        }

        // ORIGIN_STATE_ABR
        for (int i = 0; i < 1999; i++){
            query = "SELECT ORIGIN_STATE_ABR FROM flights WHERE flight_id = " + i + ";";
            list.get(0).get(0).get(0).get(i).get(0).get(0).get(0).set(query(query).get(1));
            System.out.println(query(query).get(1));
        }

        // DEST
        for (int i = 0; i < 1999; i++){
            query = "SELECT DEST FROM flights WHERE flight_id = " + i + ";";
            list.get(0).get(0).get(0).get(0).get(i).get(0).get(0).set(query(query).get(1));
            System.out.println(query(query).get(1));
        }

        // DEST_CITY_NAME
        for (int i = 0; i < 1999; i++){
            query = "SELECT DEST_CITY_NAME FROM flights WHERE flight_id = " + i + ";";
            list.get(0).get(0).get(0).get(0).get(0).get(i).get(0).set(query(query).get(1));
            System.out.println(query(query).get(1));
        }

        // DEST_STATE_ABR
        for (int i = 0; i < 1999; i++){
            query = "SELECT DEST_STATE_ABR FROM flights WHERE flight_id = " + i + ";";
            list.get(0).get(0).get(0).get(0).get(0).get(0).get(i).set(query(query).get(1));
            System.out.println(query(query).get(1));
        }

        return list;
    }
    
    public ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<Integer>>>>>>>>>>> intFlightsToArrayList(){
        ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<ArrayList<Integer>>>>>>>>>>> list = new ArrayList<Integer>();
        String query = "";

        // flight_id
        for (int i = 0; i < 1999; i++){
            list.get(i).get(0).get(0).get(0).get(0).get(0).get(0).get(0).get(0).get(0).get(0).set(i);
            System.out.println(i);
        }

        // MKT_CARRIER_FL_NUM
        for (int i = 0; i < 1999; i++){
            query = "SELECT MKT_CARRIER_FL_NUM FROM flights WHERE flight_id = " + i + ";";
            list.get(0).get(i).get(0).get(0).get(0).get(0).get(0).get(0).get(0).get(0).get(0).set(query(query).get(1));
            System.out.println(query(query).get(1));
        }

        // ORIGIN_WAC
        for (int i = 0; i < 1999; i++){
            query = "SELECT ORIGIN_WAC FROM flights WHERE flight_id = " + i + ";";
            list.get(0).get(0).get(i).get(0).get(0).get(0).get(0).get(0).get(0).get(0).get(0).set(query(query).get(1));
            System.out.println(query(query).get(1));
        }

        // DEST_WAC
        for (int i = 0; i < 1999; i++){
            query = "SELECT DEST_WAC FROM flights WHERE flight_id = " + i + ";";
            list.get(0).get(0).get(0).get(i).get(0).get(0).get(0).get(0).get(0).get(0).get(0).set(query(query).get(1));
            System.out.println(query(query).get(1));
        }

        // CRS_DEP_TIME
        for (int i = 0; i < 1999; i++){
            query = "SELECT CRS_DEP_TIME FROM flights WHERE flight_id = " + i + ";";
            list.get(0).get(0).get(0).get(0).get(i).get(0).get(0).get(0).get(0).get(0).get(0).set(query(query).get(1));
            System.out.println(query(query).get(1));
        }

        // DEP_TIME
        for (int i = 0; i < 1999; i++){
            query = "SELECT DEP_TIME FROM flights WHERE flight_id = " + i + ";";
            list.get(0).get(0).get(0).get(0).get(0).get(i).get(0).get(0).get(0).get(0).get(0).set(query(query).get(1));
            System.out.println(query(query).get(1));
        }

        // CRS_ARR_TIME
        for (int i = 0; i < 1999; i++){
            query = "SELECT CRS_ARR_TIME FROM flights WHERE flight_id = " + i + ";";
            list.get(0).get(0).get(0).get(0).get(0).get(0).get(i).get(0).get(0).get(0).get(0).set(query(query).get(1));
            System.out.println(query(query).get(1));
        }

        // ARR_TIME
        for (int i = 0; i < 1999; i++){
            query = "SELECT ARR_TIME FROM flights WHERE flight_id = " + i + ";";
            list.get(0).get(0).get(0).get(0).get(0).get(0).get(0).get(i).get(0).get(0).get(0).set(query(query).get(1));
            System.out.println(query(query).get(1));
        }

        // CANCELLED
        for (int i = 0; i < 1999; i++){
            query = "SELECT CANCELLED FROM flights WHERE flight_id = " + i + ";";
            list.get(0).get(0).get(0).get(0).get(0).get(0).get(0).get(0).get(i).get(0).get(0).set(query(query).get(1));
            System.out.println(query(query).get(1));
        }

        // DIVERTED
        for (int i = 0; i < 1999; i++){
            query = "SELECT DIVERTED FROM flights WHERE flight_id = " + i + ";";
            list.get(0).get(0).get(0).get(0).get(0).get(0).get(0).get(0).get(0).get(i).get(0).set(query(query).get(1));
            System.out.println(query(query).get(1));
        }

        //DISTANCE
        for (int i = 0; i < 1999; i++){
            query = "SELECT DISTANCE FROM flights WHERE flight_id = " + i + ";";
            list.get(0).get(0).get(0).get(0).get(0).get(0).get(0).get(0).get(0).get(0).get(i).set(query(query).get(1));
            System.out.println(query(query).get(1));
        }

        return list;
    }
}