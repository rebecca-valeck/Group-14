class Map{
  JSONObject json;

  Table airportTable; // container to hold  CSV data
  float minLon = -163, maxLon = -66; // covers the US from the West Coast to the East Coas
  float minLat = 18, maxLat = 72; // covers the US from the southern tip of Florida/Texas to the Canadian border.

  Map(String csvPath) {
    // Load the coordinate from file parameter
    airportTable = loadTable(csvPath, "header"); // ignore the first row
    if (airportTable == null) {
      println("Error: Could not find " + csvPath);
    }
  }

  void display(String origin, String destination) {
    for (TableRow row : airportTable.rows()) {  // go throught each row, pull specific data out of the current row
      String airports = row.getString("Airports");
      float lat = row.getFloat("Latitude");
      float lon = row.getFloat("Longitude");

      
      float x = map(lon, minLon, maxLon, 0, width);  // from longitude convert where in between: 0 to width pixels wide
      float y = map(lat, maxLat, minLat, 0, height);

      // Check if this specific dot is the Origin or Destination
      if (airports.equals(origin)) {  //if the current airport we are drawing is one of the two airports the user typed in.
        renderHighlight(x , y,  airports); 
         println(x, y);
      } else if ( airports.equals(destination)){
         renderHighlight(x, y,  airports); 
          println(x, y);
      }else {
        renderNormal(x , y);
      }
    }
  }

  // Others airport is represented as a smaller dot
  void renderNormal(float x, float y) {
    fill(0,0,0,0);                         //??` currently just fill with 0, need discuse -> color this or not
    noStroke();
    ellipse(x , y + 1, 4, 4);
  }

  // Dest and Origin is represented as red dot
  void renderHighlight(float x, float y, String label) {
    fill(255, 0, 0);
    stroke(255);
    strokeWeight(2);
    ellipse(x , y + 1, 20, 20);
    
    fill(100);
    textAlign(CENTER);
    textSize(12);
    text(label, x, y - 12);
  }
}