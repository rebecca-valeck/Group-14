class Plane {
    String date;
    String origin; 
    String origin_state_abr; 
    String dest;
    String dest_state_abr;
    String dest_wac;
    String crs_dep_time;
    String crs_arr_time;
    String arr_time;
    String cancelled;
    String diverted;
    String distance;
    
    float planeX;
    float planeY;
    float planeWidth = 20; 
    float planeHeight = 20;
    PImage planeImage;
    Table airportTable = loadTable("airports_coordinates_final.csv", "header");
    boolean started;

    float speed = 1;
    float sx, sy, ex, ey;

    Plane(  String date,
            String origin,
            String origin_state_abr,
            String dest,
            String dest_state_abr,
            String crs_dep_time, 
            String dest_wac ,
            String crs_arr_time,
            String arr_time,
            String cancelled,
            String diverted,
            String distance)
            

    {
        this.date = date;
        this.origin = origin;
        this.origin_state_abr = origin_state_abr;
        this.dest = dest;
        this.dest_state_abr = dest_state_abr;
        this.crs_dep_time = crs_dep_time;
        this.dest_wac = dest_wac;
        this.crs_arr_time = crs_arr_time;
        this.arr_time = arr_time;
        this.cancelled = cancelled;
        this.diverted = diverted; 
        this.distance = distance; 
        planeImage = loadImage("plane.png");
    }
    
     void planeStart(float xOffset, float yOffset, float mapWidth, float mapHeight) { // ArrayList<Plane> airportsList,
     for (TableRow row : airportTable.rows()) {
      String airportName = row.getString("Airport");

      
        if (airportName.equals(this.origin)) 
        {
          float sx = map(row.getFloat("X"), 0, 970, xOffset, xOffset + mapWidth);
          float sy = map(row.getFloat("Y"), 0, 625, yOffset, yOffset + mapHeight);
          
          this.sx = sx;
          this.sy = sy;
          planeX = sx;
          planeY = sy;
          break;
        } 
        


 

    }
  }

  void planeEnd(float xOffset, float yOffset, float mapWidth, float mapHeight) 
     { // ArrayList<Plane> airportsList,
     for (TableRow row : airportTable.rows()) 
     {
      String airportName = row.getString("Airport");

      
        if (airportName.equals(this.dest)) 
        {
          float ex = map(row.getFloat("X"), 0, 970, xOffset, xOffset + mapWidth);
          float ey = map(row.getFloat("Y"), 0, 625, yOffset, yOffset + mapHeight);
          
          this.ex = ex;
          this.ey = ey;
          break;
        } 

    }
    }
    void draw()
    {
        float mX = 10;
        float mY = 90;
        float mW = 620;
        float mH = 400;
        if(!started)
        {
        planeStart(mX, mY, mW, mH);
        planeEnd(mX, mY, mW, mH);
        started = true;
        }
        image(planeImage, planeX, planeY, planeWidth, planeHeight);
    }
    
    // void move(){
    //     float run = ex - sx;
    //     float rise = ey - sy;
    //     if(sx < ex && sy < ey){
    //         if (planeX < ex && planeY < ey){
    //             planeX += (rise/run) * speed;
    //             planeY += (run/rise) * speed;
    //         }
    //     }
    //     else if (sx > ex && sy < ey){
    //         if (planeX > ex && planeY < ey){
    //             planeX += (rise/run) * speed;
    //             planeY += (run/rise) * speed * -1;
    //         }
    //     }
    //     else if (sx < ex && sy > ey){
    //         if (planeX < ex && planeY > ey){
    //             planeX += (rise/run) * speed * -1;
    //             planeY += (run/rise) * speed;
    //         }
    //     }
    //     else if (sx > ex && sy > ey){
    //         if (planeX > ex && planeY > ey){
    //             planeX += (rise/run) * speed *-1;
    //             planeY += (run/rise) * speed *-1;
    //         }
    //     }
    // }

    void move() {
    float dx = ex - planeX; // direction x
    float dy = ey - planeY; // direction y

    float distance = sqrt(dx * dx + dy * dy); // distance = sqrt of dx^2 + dy^2

    if (distance > speed) {
        planeX += (dx / distance) * speed; 
        planeY += (dy / distance) * speed;
    } 
    else {

        planeX = ex;
        planeY = ey;
    }
}
}