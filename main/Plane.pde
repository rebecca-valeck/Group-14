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
  boolean started;

  float speed = 0.25;
  float sx, sy, ex, ey;

  Plane(  String date,
    String origin,
    String origin_state_abr,
    String dest,
    String dest_state_abr,
    String crs_dep_time,
    String dest_wac,
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
      if(sx != 0 && sy != 0){break;}

    }
    this.planeX = this.sx;
    this.planeY = this.sy;
  }


void draw()
{
  float mX = 10;
  float mY = 90;
  float mW = 620;
  float mH = 400;
  if (!started)
  {
    planeStart();
    started = true;
  }
  image(planeImage, planeX, planeY, planeWidth, planeHeight);
}

void move() {
  float run = ex - sx;
  float rise = ey - sy;
  if (sx < ex && sy < ey) {
    if (planeX < ex && planeY < ey) {
      planeX += (rise/run) * speed;
      planeY += (run/rise) * speed;
    }
  } else if (sx > ex && sy < ey) {
    if (planeX > ex && planeY < ey) {
      planeX += (rise/run) * speed;
      planeY += (run/rise) * speed * -1;
    }
  } else if (sx < ex && sy > ey) {
    if (planeX < ex && planeY > ey) {
      planeX += (rise/run) * speed * -1;
      planeY += (run/rise) * speed;
    }
  } else if (sx > ex && sy > ey) {
    if (planeX > ex && planeY > ey) {
      planeX += (rise/run) * speed *-1;
      planeY += (run/rise) * speed *-1;
    }
  }
}
}