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

Button date = new Button(40, 70, 450, 30, "Enter date and time in dd/mm/yyyy hh:mm format");
Button origin = new Button(500, 70, 100, 30, "Origin");
ArrayList<ArrayList<String>> originAirports;
ArrayList<Checkbox> origins = new ArrayList<Checkbox>();
Scrollbar bar;
int offset = 0;
Checkbox cancelled = new Checkbox(610, "Cancelled");

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
  screens.get(1).addButton(date);
  screens.get(1).addButton(origin);
  screens.get(1).addCheckbox(cancelled);

  screens.get(2).addButton(back);

  screens.get(3).addButton(back);

  theScreen = screens.get(0);

  originAirports = db.query("SELECT DISTINCT(ORIGIN) FROM flights ORDER BY ORIGIN ASC;");
  for(int i = 0; i < originAirports.size(); i++){
    origins.add(new Checkbox(510, originAirports.get(i).get(0)));
  }
  bar = new Scrollbar(800 - 8, 110, 16, 505, 16);
}

void draw() {
  theScreen.draw();

  if(origin.checked){
    fill(255);
    stroke(0);
    rect(500, 110, 300, 505);

    int i = ((int)bar.getPos() / (bar.sh/(origins.size()-20))-22);
    if(i < origins.size() - 21 && i >= 0){
      for (int j = 0; j <20; j++){
        origins.get(i+j).draw(115+ j * 25);
      }
    } else if (i >= origins.size()-21){
      for (int j = 0; j <20; j++){
        int index = origins.size() -20;
        origins.get(index+j).draw(115+ j * 25);
      }
    }else if (i < 0){
      for (int j = 0; j <20; j++){
        int index = 0;
        origins.get(index+j).draw(115+ j * 25);
      }
    }

    bar.update();
    bar.draw();
  }
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
  else if (date.clicked(mouseX, mouseY)){
    origin.checked = false;
    if (date.label == "Enter date and time in dd/mm/yyyy hh:mm format") {
      date.label = "| ";
    }
  }
  origin.clicked(mouseX, mouseY);
  for (Checkbox c: origins){
    c.clicked(mouseX, mouseY);
  }
  cancelled.clicked(mouseX, mouseY);

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
