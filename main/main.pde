import java.util.Arrays;
final int SCREENX = 1920;
final int SCREENY = 1080;
Barchart chart;
color squareColor = color(200);
ArrayList<Screen> screens = new ArrayList<Screen>();
Screen theScreen;
DatabaseQueries db = new DatabaseQueries();
PImage plane;
Button addFilter = new Button(40, 300, 100, 50, "Add filters:", 30);
Button search = new Button(1300, 700, 100, 50, "SEARCH", 30);
Button searchDes = new Button(SCREENX/3-75, 150, 370, 70, "Search by destination", 30);
Button graph = new Button(SCREENX/2+10, SCREENY/2, 50, 50, "graph",30);
Button back = new Button(40, 10, 100, 50, "Back",30);
PFont  font;
float x

String userInputDestination="";
boolean change = false;


void settings() {
  size(SCREENX, SCREENY);
}
void setup()
{
  plane=loadImage("aereo.jpg");
  noStroke();
  DatabaseQueries.dbPath = sketchPath("database.db");
  font = loadFont("PoorRichard-Regular-30.vlw");
  textFont(font);

  screens.add (new Screen(color(#2E5E8E)));
  screens.add (new Screen(color(#2E5E8E)));
  screens.add (new Screen(color(#2E5E8E)));
  screens.add (new Screen(color(#2E5E8E)));


  screens.get(0).addButton(addFilter);
  screens.get(0).addButton(search);
  screens.get(0).addButton(searchDes);
  screens.get(0).addButton(graph);

  
  screens.get(1).addButton(back);

  screens.get(2).addButton(back);

  screens.get(3).addButton(back);

  theScreen = screens.get(0);


}

void draw() {
  plane.resize(SCREENX/3,100);
  image (plane, -plane.width, 0);
  theScreen.draw();
}

void mousePressed()
{
  if(plane.x != 0){
    plane.x += 0.2;
  }
  if(back.clicked(mouseX, mouseY)){
    theScreen = screens.get(0);
  } 
  else if (search.clicked(mouseX, mouseY)) {
    theScreen = screens.get(2);
  } 
  else if (addFilter.clicked(mouseX, mouseY)) {
    theScreen = screens.get(1);
  } 
  else if (graph.clicked(mouseX, mouseY)) {
    theScreen = screens.get(3);
    screens.get(3).addBarchart(new Barchart(SCREENX/2, SCREENY/2, 800, 600, 60, userInputDestination, "Number of Flights"));
  } 
  else if (searchDes.clicked(mouseX, mouseY)) {
    searchDes.label = "| ";
  }

/*
  for (Button b : theScreen.button) {
    if (b.clicked(mouseX, mouseY)) {
      switch(b.label){
        case("Back"):
          theScreen = screens.get(0);
          break;
        case("SEARCH"):
          theScreen = screens.get(2);
          break;
        case("Add filters:"):
          theScreen = screens.get(1);
          break;
        case("graph"):
          theScreen = screens.get(3);
          screens.get(3).addBarchart(new Barchart(SCREENX/2, SCREENY/2, 800, 600, 60, userInputDestination, "Number of Flights"));
        break;
        case("clear"):
          change = true;
          break;
        case("search by destination"):
          b.label = "| ";
          break;
        default:
          return;
      }
    }
  }
    */
}

void mouseMoved() {
  for (Button b : theScreen.button) {
    if (b.clicked(mouseX, mouseY)) b.stroke = true;
    else b.stroke = false;
  }
}

