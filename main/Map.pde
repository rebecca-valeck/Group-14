class Map {
  JSONObject json;

  Table airportTable; // container to hold  CSV data

  Map(String csvPath) {
    // Load the coordinate from file parameter
    airportTable = loadTable(csvPath, "header"); // ignore the first row
    if (airportTable == null) {
      println("Error: Could not find " + csvPath);
    }
  }


  void display(ArrayList<Plane> airportsList, float xOffset, float yOffset, float mapWidth, float mapHeight) {
    for (TableRow row : airportTable.rows()) {
      String airportName = row.getString("Airport");

      // Scale coordinates from original 970x625 space to current position/size
      float x = map(row.getFloat("X"), 0, 970, xOffset, xOffset + mapWidth);
      float y = map(row.getFloat("Y"), 0, 625, yOffset, yOffset + mapHeight);

      // Check if this specific airport is in your 'chosen' list
      boolean isSelected = false;
      for (Plane plane : airportsList) {
        if (airportName.equals(plane.origin)) {
          isSelected = true;
          break; // Stop looking once found
        }
      }

      // Draw the correct style
      if (isSelected) {
        renderHighlight(x, y, airportName);
      } else {
        renderNormal(x, y);
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

    // Define where the map goes (Left side)
    float mX = 20;
    float mY = 100;
    float mW = 620;
    float mH = 400;

    // Draw the image
    image(bg, mX, mY, mW, mH);

    // Draw the airports on top of that specific area
    display(sim.planes, mX, mY, mW, mH);
  }
}
