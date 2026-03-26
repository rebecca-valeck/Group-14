
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

void draw() {
  background(bg); // Need to be replaced with suistable map
  
  //Dest and Origin are highlighted 
  graph.display(airports);
}
 // Finding coordinate
 //void mousePressed(){
 //  print(mouseX, mouseY , " ");
 //}


