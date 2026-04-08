class Plane 
{
  String date;
  String origin;
  String origin_state_abr;
  String dest;
  String dest_state_abr;
  String dest_wac;
  String crs_dep_time;
  String dep_time;
  String crs_arr_time;
  String arr_time;
  String cancelled;
  String diverted;
  String distance;

  float planeX;
  float planeY;
  float planeWidth = 20;
  float planeHeight = 20;
  boolean started;
  boolean move;
  boolean speedAltered;
  int planeTime;
  Table airportTable = loadTable("airports_coordinates_final.csv", "header");

  float speed = 1;
  float sx, sy, ex, ey;

  Plane(  String date,
    String origin,
    String origin_state_abr,
    String dest,
    String dest_state_abr,
    String dest_wac,
    String crs_dep_time,
    String dep_time,
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
        this.dest_wac = dest_wac;
        this.crs_dep_time = crs_dep_time;
        this.dep_time = dep_time;
        this.crs_arr_time = crs_arr_time;
        this.arr_time = arr_time;
        this.cancelled = cancelled;
        this.diverted = diverted; 
        this.distance = distance; 
        planeImage = loadImage("plane.png");
    }
    
    // sets the planes starting X and Y coordinates for the selected origin airports
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
  // sets the planes ending X and Y coordinates for the selected destination airports
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
    // draws the planes 
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
    

    // makes the planes move from the origin airport to destination airport
    // speed is altered based on the duration of the flight
    void move() 
    {
      float dx = ex - planeX;
      float dy = ey - planeY; 

      float distance = sqrt(dx * dx + dy * dy);
      if(!speedAltered && arr_time != "" && dep_time != "")
      {
        speed = speed / (((float)Integer.parseInt(arr_time) - (float)Integer.parseInt(dep_time)) / 250);

        println(speed);
        speedAltered = true;
      }

      if (distance > speed) 
      {
        planeX += (dx / distance) * Math.abs(speed); 
        planeY += (dy / distance) * Math.abs(speed);
      } 
      else 
      {
        planeX = ex;
        planeY = ey;
      }
    }
}