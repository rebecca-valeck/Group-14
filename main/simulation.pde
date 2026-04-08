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
    // Draw the image

    // Draw the airports on top of that specific area
    graph.draw();
    
    // draws planes
    // makes planes move based on their departing time
    // draws line from starting airport to plane
    for (Plane p : planes) {
      p.draw();
      if(theScreen == screens.get(0))
    {
      p.planeTime = 0;
    }
      String timeString = "" + p.planeTime;
      p.planeTime+= 10;
      println(timeString);
      if(!p.arr_time.isEmpty() && !timeString.isEmpty())
      {
        if(Integer.parseInt(timeString) >= Integer.parseInt(p.arr_time))
        {
          p.move = true;
        }
      }
      if(p.move)
      {
      p.move();
      }
      line = new Line(p.sx,p.sy,p.planeX,p.planeY);
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
