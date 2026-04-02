  ArrayList<String> variables = new ArrayList<String>(Arrays.asList(
    "flight_id","date", "MKT_CARRIER", "MKT_CARRIER_FL_NUM", "ORIGIN", "ORIGIN_CITY_NAME", "ORIGIN_STATE_ABR",
     "ORIGIN_WAC", "DEST", "DEST_CITY_NAME", "DEST_STATE_ABR", "DEST_WAC", "CRS_DEPT_TIME", "DEPT_TIME",
    "CRS_ARR_TIME","ARR_TIME", "CANCELLED", "DIVERTED", "DISTANCE"));


class Barchart{
    float x, y, w,h,gap;
    String title;
    String y_title ="filtered flights";
    String x_title = "destination";
    ArrayList<ArrayList<String>> data;
    // this is a constructor for filtered count charts where y is the count of flights that meet the origin filter conditions and x is destination
    Barchart(float x, float y, float w, float h, float gap ,
        ArrayList<Checkbox> origins,
        ArrayList<Checkbox> destinations,
        String dates,
        String distance,
        String arrivalTime,
        String departureTime,
        String x_title, String groupBy){
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.gap = gap;
        this.x_title = x_title;
        this.y_title = "count of flights";
        this.title = "Flights by" ;
        this.data = db.filteredQuery(origins,destinations,dates,distance,arrivalTime,departureTime,this.w,this.gap,groupBy,"SELECT "+ x_title +", COUNT(*) FROM flights ");
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
        }
        this.y_title = y_title;
        
 
    }


    void draw(){
        if (data != null){
            fill(#E2E8F4);
            rect(x-w/2, y-h/2, w, h);
            for (int i = 0; i < data.size(); i++){
                float barHeight = map(float(data.get(i).get(1)), 0, float(data.get(0).get(1)), 0, h-100);
                fill(#2E5E8E);
                rect(x-w/2 + 50 + i*gap, y+h/2 - barHeight - 50, 40, barHeight);
                fill(#14283E);
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