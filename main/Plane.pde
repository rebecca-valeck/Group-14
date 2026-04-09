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
  Integer dep_time_in_hours;
  String crs_arr_time;
  String arr_time;
  Integer arr_time_in_hours;
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

  float speed = 30;
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
        this.dep_time_in_hours = ((int(dep_time) /100) * 100 + (int(dep_time) % 100)*100/60);
        this.arr_time_in_hours = ((int(arr_time) /100) * 100 + (int(arr_time) % 100)*100/60);
        if (this.arr_time_in_hours < this.dep_time_in_hours){
          this.arr_time_in_hours += 2400;
          this.arr_time = (int(arr_time) + 2400) +"";
        } 
        this.cancelled = cancelled;
        this.diverted = diverted; 
        this.distance = distance; 
        planeImage = loadImage("plane.png");
    }
    
 void planeStart() { // ArrayList<Plane> airportsList,
    for (ArrayList<String> a : sim.graph.airportLocations) {
      if (a.get(0).equals(origin)) {

        this.sx = float(a.get(1));
        this.sy = float(a.get(2));
      }
      if (a.get(0).equals(dest)) {
        this.ex = float(a.get(1));
        this.ey = float(a.get(2));
      }
      if(sx != 0 && ex != 0){break;}

    }
    this.planeX = this.sx;
    this.planeY = this.sy;
  }



    void draw()
    {
      
        if(!started)
      {
        planeStart();
        started = true;
      }
        if ((sx != 0 && ex != 0) && (planeX != sx && planeY != sy) && (planeX != ex && planeY != ey)){image(planeImage, planeX - 10, planeY -10, planeWidth, planeHeight);}
    }
    

    // makes the planes move from the origin airport to destination airport
    // speed is altered based on the duration of the flight
    void move() 
    {
      if (sx != 0 && ex != 0){
        float dx = ex - planeX;
        float dy = ey - planeY; 

        float distance = sqrt(dx * dx + dy * dy);
        if(!speedAltered && arr_time != "" && dep_time != "")
        {
          speed = 1 / (((float)Integer.parseInt(arr_time) - (float)Integer.parseInt(dep_time)) / 500);
          if (speed < 10) speed = 10;
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
}