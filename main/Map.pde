class Map {

    float mX = 20;
    float mY = 120;
    float mW = 970 * 0.8;
    float mH = 625 * 0.8;

  JSONObject json;
  ArrayList<ArrayList<String>> airportLocations = new  ArrayList<ArrayList<String>>();
  Table airportTable; // container to hold  CSV data

  Map(String csvPath) {
    // Load the coordinate from file parameter
    airportTable = loadTable(csvPath, "header"); // ignore the first row
    if (airportTable == null) {
      println("Error: Could not find " + csvPath);
    }
    
  }

  void generateAirportLocations(ArrayList<Plane> airportsList) {
    airportLocations.clear();
    for (TableRow row : airportTable.rows()) {
      String airportName = row.getString("Airport");

      // Scale coordinates from original 970x625 space to current position/size
      float x = map(row.getFloat("X"), 0, 970, mX, mX + mW);
      float y = map(row.getFloat("Y"), 0, 625, mY, mY + mH);
      ArrayList<String> tempAirport = new ArrayList<String>();
      tempAirport.add(airportName);
      tempAirport.add(str(x));
      tempAirport.add(str(y));

      // Check if this specific airport is in 'chosen' list
      boolean isSelected = false;
      for (Plane plane : airportsList) {
        if (airportName.equals(plane.origin)) {
          isSelected = true;
          break; // Stop looking once found
        }
      }
      tempAirport.add(str(isSelected));
      airportLocations.add(tempAirport);

      
    }
  }
  void display() {
    
    for (ArrayList<String> airport : airportLocations){
      // Draw the correct style
      if (airport.get(3) == "true") {
        renderHighlight(float (airport.get(1)), float(airport.get(2)), airport.get(0));
      } else {
        renderNormal(float (airport.get(1)), float(airport.get(2)));
      }
  }
}
// Others airport is represented as a smaller dot
void renderNormal(float x, float y) {
  fill(240, 255, 255);
  noStroke();
  ellipse(x, y, 7, 7);
}

// Dest and Origin is represented as red dot
void renderHighlight(float x, float y, String label) {
  fill(46, 94, 142);
  stroke(255);
  strokeWeight(2);
  ellipse(x, y, 20, 20);

  fill(46, 94, 142);
  textAlign(CENTER);
  textSize(12);
  text(label, x, y - 16);
}


void draw() {

  // Draw the image
  image(bg, mX, mY, mW, mH);

  // Draw the airports on top of that specific area
  display();
}
}
