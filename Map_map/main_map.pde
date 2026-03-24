
PImage bg;

String[] airports = {"MIA", "LAS", "LAX", "JFK"}; // replace with the array real array
Map graph;

void setup() {
  size(970, 625);  // this size should be equal to the bg
  // Initialize the class with the lookup file
  graph = new Map("Airports Co-ordinates(1).csv");    // replace this with real file
  
  bg = loadImage("us-ver4.PNG");
  bg.resize(970, 625);  // original (960 x 624)
   pixelDensity(1);
}

void draw() {
  background(bg); // Need to be replaced with suistable map
  
  //Dest and Origin are highlighted 
  graph.display(airports);
}

/*
Im hardcode the min,max long/lat so that it fit possition according to the map
as the cooridinate is 3D, but processing is 2D so it does not have gernaral min,max long/lat
for all destination
Please use 2 of these couple below
  MIA - LAS : minLon = -123 ; maxLon = -72; minLat = 22.5;  maxLat = 51.0
  LAX - JFK :  minLon = -124 ; maxLon = -69; minLat = 22.5;  maxLat = 51.0 (this also work with MIA - LAS but MIA is abit up to north)
*/