  ArrayList<String> variables = new ArrayList<String>(Arrays.asList(
    "flight_id","date", "MKT_CARRIER", "MKT_CARRIER_FL_NUM", "ORIGIN", "ORIGIN_CITY_NAME", "ORIGIN_STATE_ABR",
     "ORIGIN_WAC", "DEST", "DEST_CITY_NAME", "DEST_STATE_ABR", "DEST_WAC", "CRS_DEPT_TIME", "DEPT_TIME",
    "CRS_ARR_TIME","ARR_TIME", "CANCELLED", "DIVERTED", "DISTANCE"));


class Barchart{
    float x, y, w, h,gap;
    String title;
    String y_title ="filtered flights";
    String x_title = "destination";
    ArrayList<ArrayList<String>> data;
    // this is a constructor for filtered count charts where y is the count of flights that meet the origin filter conditions and x is destination
    Barchart(float x, float y, float w, float h, float gap ,ArrayList<Checkbox> origins){
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.gap = gap;
        this.title = "Flights by" ;

        String filteredAirports = "WHERE ";
        String originBuffer = "";
        for(int i = 0; i < origins.size() -1; i++){
            
            if (origins.get(i).checked){
                if (originBuffer != "") filteredAirports += "ORIGIN = \"" +originBuffer +"\" OR ";
                originBuffer =  origins.get(i).label;
            } 
        }
        filteredAirports += "ORIGIN = \"" +originBuffer +"\"";
        
        System.out.println("SELECT DEST, COUNT(*) FROM flights " + filteredAirports + " GROUP BY DEST ORDER BY COUNT(*) DESC LIMIT " +  (int)((w - 50) /  gap));
        data = db.query(
                "SELECT DEST, COUNT(*) FROM flights " + filteredAirports + " GROUP BY DEST ORDER BY COUNT(*) DESC LIMIT " +  (int)((w - 50) /  gap)
                );


    }
    //this is for simple count charts where y is number of flights and x the different variables of the given x_title column
    Barchart(float x, float y, float w, float h, float gap ,String x_title, String y_title){
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.gap = gap;
        this.title = "Flights by" + x_title;
        if (variables.contains(x_title)){
            this.x_title = x_title;
                        data = db.query(
                "SELECT " + x_title +", COUNT(*) FROM flights GROUP BY " + x_title +" ORDER BY COUNT(*) DESC LIMIT " +  (int)((w - 50) /  gap)
                );
        }
        this.y_title = y_title;
 
    }


    void draw(){
        if (data != null){
            fill(255);
            rect(x-w/2, y-h/2, w, h);
            for (int i = 0; i < data.size(); i++){
                float barHeight = map(float(data.get(i).get(1)), 0, float(data.get(0).get(1)), 0, h-100);
                fill(100, 150, 200);
                rect(x-w/2 + 50 + i*gap, y+h/2 - barHeight - 50, 40, barHeight);
                fill(0);
                textAlign(CENTER);
                text(data.get(i).get(0), x-w/2 + 70 + i*gap, y+h/2 - 30);
            }
            text( x_title, x, y + h/2 -10);
            pushMatrix();
            translate(x - w/2  +30, y);
            rotate(-HALF_PI);
            text( y_title, 0,0);
            popMatrix();

        }




    }

}