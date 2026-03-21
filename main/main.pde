import java.util.Arrays;
final int SCREENX = 1920;
final int SCREENY = 1080;
Barchart chart;
color squareColor = color(200);
ArrayList<Screen> screens = new ArrayList<Screen>();
Screen theScreen;
DatabaseQueries db = new DatabaseQueries();

Button addFilter = new Button(40, 300, 100, 50, "Add filters:");
Button search = new Button(1300, 700, 100, 50, "SEARCH");
Button searchDes = new Button(SCREENX/3-200, 70, 200, 50, "search by destination");
Button graph = new Button(SCREENX/2+10, SCREENY/2, 50, 50, "graph");
Button back = new Button(40, 10, 100, 50, "Back");

FilterButton date = new FilterButton(40, 70, 450, 30, "Enter date and time in dd/mm/yyyy hh:mm format");

String userInputDestination="";
String userInputDate = "";
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


  screens.get(0).addButton(addFilter);
  screens.get(0).addButton(search);
  screens.get(0).addButton(searchDes);
  screens.get(0).addButton(graph);

  
  screens.get(1).addButton(back);
  screens.get(1).addFilterButton(date);

  screens.get(2).addButton(back);

  screens.get(3).addButton(back);

  theScreen = screens.get(0);


}

void draw() {
  theScreen.draw();
}

void mousePressed()
{
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
  else if (date.clicked(mouseX, mouseY) && date.label == "Enter date and time in dd/mm/yyyy hh:mm format") {
    date.label = "|";
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

  for (FilterButton b : theScreen.filters) {
    if (b.clicked(mouseX, mouseY)) b.stroke = true;
    else b.stroke = false;
  }
}
