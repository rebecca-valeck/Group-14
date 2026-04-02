
PImage bg;

String[] airports = {"MIA", "LAS", "LAX", "JFK", "ABQ", "ANC"}; // replace with real array

Map graph;

void setup() {
  size(970,625);  // this size should be equal to the bg
  // Initialize the class with the lookup file
  graph = new Map("airports_coordinates_final.csv");   
  bg = loadImage("final.svg.jpg");
  bg.resize(970, 625);  // original (960 x 624)
   pixelDensity(1);
}

// void draw() {
//   background(bg); // Need to be replaced with suistable map
  
//   //Dest and Origin are highlighted 
//   graph.display(airports);
// }
//  // Finding coordinate
//  //void mousePressed(){
//  //  print(mouseX, mouseY , " ");
//  //}

 void draw() {
  background(210, 225, 240); // Light blue background for the whole app
  
  // Define where the map goes (Left side)
  float mX = 20; 
  float mY = 100;
  float mW = 620; 
  float mH = 400;

  // Draw the image
  image(bg, mX, mY, mW, mH); 

  // Draw the airports on top of that specific area
  graph.display(airports, mX, mY, mW, mH);
}
