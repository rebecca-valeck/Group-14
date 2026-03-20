import java.util.Arrays;
final int SCREENX = 1920;
final int SCREENY = 1080;
Barchart chart;
Color squareColor = color(200);
ArrayList<Screen> screens = new ArrayList<Screen>();
Screen theScreen;
DatabaseQueries db = new DatabaseQueries();

String userInputDestination="";
boolean change = false;


void settings() {
  size(SCREENX, SCREENY);
}
void setup()
{
  DatabaseQueries.dbPath = sketchPath("database.db");


  screens.add (new Screen(color(150)));
  screens.add (new Screen(color(150)));
  screens.add (new Screen(color(150)));
  screens.add (new Screen(color(150)));


  screens.get(0).addButton(new Button(40, 300, 100, 50, "Add filters:"));
  screens.get(0).addButton(new Button(1300, 700, 100, 50, "SEARCH"));
  screens.get(0).addButton(new Button(SCREENX/3-200, 70, 200, 50, "search by destination"));
  screens.get(0).addButton(new Button(SCREENX/3+10, 70, 50, 50, "clear"));
  screens.get(0).addButton(new Button(SCREENX/2+10, SCREENY/2, 50, 50, "graph"));

  
  screens.get(1).addButton(new Button(40, 10, 100, 50, "Back"));

  screens.get(2).addButton(new Button(40, 10, 100, 50, "Back"));

  screens.get(3).addButton(new Button(40, 10, 100, 50, "Back"));

  theScreen = screens.get(0);


}

void draw() {
  theScreen.draw();
}

void mousePressed()
{
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
}

void mouseMoved() {
  for (Button b : theScreen.button) {
    if (b.clicked(mouseX, mouseY)) b.stroke = true;
    else b.stroke = false;
  }
}
