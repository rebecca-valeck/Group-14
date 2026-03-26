class Map{
  JSONObject json;

  Table airportTable; // container to hold  CSV data
    
  Map(String csvPath) {
    // Load the coordinate from file parameter
    airportTable = loadTable(csvPath, "header"); // ignore the first row
    if (airportTable == null) {
      println("Error: Could not find " + csvPath);
    }
    
  }
  
  void display(String[] airportsList) {
    for (TableRow row : airportTable.rows()) {
      String airports = row.getString("Airport");
      float lat = row.getFloat("X");
      float lon = row.getFloat("Y");

      /*
      NOT ESSENTIAL ANYMORE
      // --- THE FIX: after using anchor point, miami x = 798 y = 551 ; washing ton x = 62 y = 26
      
      // Decide min/max lat/long, width, height
      //using  pixels: 62 to 798
      //float x = map(lon, -121, -80.19, 62, 798);
      
      //// Latitude (Y): Map from Washington (48.3) to Miami (25.76)
      //// using pixels: 26 to 551
      //float y = map(lat, 48.3, 25.76, 26, 551);
      */

      for (int i = 0 ; i <airportsList.length; i ++ ){
        String placeHolder = airportsList[i];
        if (airports.equals( placeHolder)) {  
           renderHighlight(lat, lon, airports);
        }else {
          renderNormal(lat, lon );
        }
      }
    }
  }

  // Others airport is represented as a smaller dot
  void renderNormal(float x, float y) {                                   
     fill(240, 255, 255);                          
    noStroke();
    ellipse(x , y, 4, 4);
  }

  // Dest and Origin is represented as red dot
  void renderHighlight(float x, float y, String label) {
    fill(46, 94, 142);
    stroke(255);
    strokeWeight(2);
    ellipse(x , y , 20, 20);
    
    fill(46, 94, 142);  
    textAlign(CENTER);
    textSize(12);
    text(label, x , y - 16);
  }
}