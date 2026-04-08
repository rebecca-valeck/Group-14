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

    Table airportTable = loadTable("airports_coordinates_final.csv", "header");
    
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
            //float sx, float sy, float ex, float ey)

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
        //planeX = sx;
        //planeY = sy;
        //this.sx = sx;
        //this.sy = sy;
        //this.ex = ex;
        //this.ey = ey;
        
    }
    
     void display(float xOffset, float yOffset, float mapWidth, float mapHeight) { // ArrayList<Plane> airportsList,
     for (TableRow row : airportTable.rows()) {
      String airportName = row.getString("Airport");

      
        if (airportName.equals(this.origin)) 
        {
          float x = map(row.getFloat("X"), 0, 970, xOffset, xOffset + mapWidth);
          float y = map(row.getFloat("Y"), 0, 625, yOffset, yOffset + mapHeight);
          
          planeX = x;
          planeY = y;
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
        display(mX, mY, mW, mH);
        image(planeImage, planeX, planeY, planeWidth, planeHeight);
    }
    
    void move(){
        float run = ey - sy;
        float rise = ex - sx;
        if(sx < ex && sy < ey){
            if (planeX < ex && planeY < ey){
                planeX += (rise/run) * speed;
                planeY += (run/rise) * speed;
            }
        }
        else if (sx > ex && sy < ey){
            if (planeX > ex && planeY < ey){
                planeX += (rise/run) * speed;
                planeY += (run/rise) * speed * -1;
            }
        }
        else if (sx < ex && sy > ey){
            if (planeX < ex && planeY > ey){
                planeX += (rise/run) * speed * -1;
                planeY += (run/rise) * speed;
            }
        }
        else if (sx > ex && sy > ey){
            if (planeX > ex && planeY > ey){
                planeX += (rise/run) * speed *-1;
                planeY += (run/rise) * speed *-1;
            }
        }
    }
}