
PImage bg;

String[] airports = {"MIA", "LAS", "LAX", "JFK"}; // replace with the array real array
Map graph;

void setup() {
  size(970, 625);  // this size should be equal to the bg
  // Initialize the class with the lookup file
  graph = new Map("Airports Co-ordinates(1).csv");    // replace this with real file
  
  bg = loadImage("us-ver4.PNG");
  bg.resize(970, 625);  // original map(960 x 624)
   pixelDensity(1);
}

void draw() {
  background(bg); // Need to be replaced with suistable map
  
  //Dest and Origin are highlighted 
  graph.display(airports);
}

