

String currentOrigin = "JFK";      // replace this with the input from user
String currentDest = "LAX";
Map graph;

void setup() {
  size(1000, 600);
  // Initialize the class with the lookup file
  graph = new Map("unique_airports.csv");    // replace this with real file
}

void draw() {
  background(40); // Need to be replaced with suistable map
  
  
  //Dest and Origin are highlighted 
  graph.display(currentOrigin, currentDest);
}
