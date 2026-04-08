class Simulation {
  int gameTime = 0;
  int gameTickSpeed = 1;
  ArrayList<Plane> planes = new ArrayList<Plane>();
  Map currentMap;
  Map graph;   // replace with real name of class
  Line line;

Simulation(){
  graph = new Map("airports_coordinates_final.csv");
}
  void setMap(Map m) {
    this.currentMap = m;

  }

  void start() {
    gameTime = 0;
  }

  void draw() {
    float mX = 20;
    float mY = 100;
    float mW = 620;
    float mH = 400;
    // Draw the image
    image(bg, mX, mY, mW, mH);

    // Draw the airports on top of that specific area
    graph.draw();
    
    for (Plane p : planes) {
      p.draw();
      if(theScreen == screens.get(0))
    {
      p.planeTime = 0;
    }
      String timeString = "" + p.planeTime;
      p.planeTime++;
      //println("arr_time: " + p.arr_time);
      //println("timeString: " + timeString);
      if(p.arr_time.equals(timeString))
      {
        p.move = true;
      }
      if(p.move)
      {
      p.move();
      }
      line = new Line(p.sx + 10,p.sy + 10,p.planeX + 10,p.planeY + 10);
      line.draw();
    }
  }
  void addPlanes(ArrayList<ArrayList<String>> planesQuery) {
    if(theScreen == screens.get(0))
    {
      planes.clear();
    }
    for (ArrayList<String> plane : planesQuery) {

      planes.add(new Plane(
        plane.get(1), // date
        plane.get(4), // origin
        plane.get(6), // origin state abr
        plane.get(8), // dest
        plane.get(10), // dest state abr
        plane.get(11), // dept wac
        plane.get(12), // crs dept time
        plane.get(13), // dept time
        plane.get(14), // crs arr time
        plane.get(15), // arr time
        plane.get(16), // cancelled
        plane.get(17), // diverted
        plane.get(18)  // distance
        
        ));
    }

  }
}
