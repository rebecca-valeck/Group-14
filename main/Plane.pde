class Plane {
    String date;
    String origin; 
    String origin_state_abr; 
    String dest;
    String dest_state_abr;
    float dest_wac;
    float crs_dep_time;
    float crs_arr_time;
    float arr_time;
    float cancelled;
    float diverted;
    float distance;

    Plane( String date, String origin, String origin_state_abr, String dest,
           String dest_state_abr, float crs_dep_time, float dest_wac , float crs_arr_time,
           float arr_time, float cancelled, float diverted, float distance) {
        this.date = date;
        this.origin = origin;
        this.origin_state_abr = origin_state_abr;
        this.dest_state_abr = dest_state_abr;
        this.dest = dest;
        this.dest_wac = dest_wac;
        this.crs_dep_time = crs_dep_time;
        this.crs_arr_time = crs_arr_time;
        this.cancelled = cancelled;
        this.diverted = diverted; 
        this.distance = distance;
    }
    // void draw (){
    //     circle (map.getXcoordinate (origin, origin_state_abr),
    //             map.getYcoordinate (origin, origin_state_abr),
    //             10 )
    // }
    

   

}