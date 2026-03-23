class Map{
  JSONObject json;

  Table airportTable; // container to hold  CSV data
 
   // --- HArd code max/min lat long -> no need more 

  //float minLon = -123; // LAX - JFK case
  //float maxLon = -69;  
  
  ////float minLon = -123; // MIA - LAS
  ////float maxLon = -72;  // Decreased to push MIA further Right
  
  //float minLat = 22.5;   // Southern boundary 
  //float maxLat = 51.0;   // Northern boundary
  
  //float minLon = -127.0; // West Coast (approx. edge of image)
  // float  maxLon = -66.0;  // East Coast (approx. edge of image)
  //  float minLat = 23.0;   // Southern tip of Florida/Texas
  // float maxLat = 50.0;   // Northern border/top of image
    
  Map(String csvPath) {
    // Load the coordinate from file parameter
    airportTable = loadTable(csvPath, "header"); // ignore the first row
    if (airportTable == null) {
      println("Error: Could not find " + csvPath);
    }
    
  }
  


  void display(String origin, String destination) {
    for (TableRow row : airportTable.rows()) {
      String airports = row.getString("Airports");
      float lat = row.getFloat("Latitude");
      float lon = row.getFloat("Longitude");
  
      // --- THE FIX: after using anchor point, miami x = 798 y = 551 ; washing ton x = 62 y = 26
      
      // Decide min/max lat/long, width, height
      //using your pixels: 62 to 798
      float x = map(lon, -120, -80.19, 62, 798);
      
      // Latitude (Y): Map from Washington (48.3) to Miami (25.76)
      // using pixels: 26 to 551
      float y = map(lat, 48.3, 25.76, 26, 551);
  
     if (airports.equals(origin)) {  //if the current airport we are drawing is one of the two airports the user typed in.
          renderHighlight(x, y,  airports); 
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
    ellipse(x , y, 4, 4);
  }

  // Dest and Origin is represented as red dot
  void renderHighlight(float x, float y, String label) {
    fill(250, 0, 0);
    stroke(255);
    strokeWeight(2);
    ellipse(x , y , 25, 25);
    
    fill(250, 0 ,0);
    textAlign(CENTER);
    textSize(12);
    text(label, x , y - 16);
  }
}