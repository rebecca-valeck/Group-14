import java.util.Arrays;
final int SCREENX = 1280;
final int SCREENY = 720;

DatabaseQueries db = new DatabaseQueries();
Barchart chart;
Screen theScreen;
ArrayList<Screen> screens = new ArrayList<Screen>();
ArrayList<Checkbox> origins = new ArrayList<Checkbox>();
ArrayList<ArrayList<String>> originAirports; //= db.query("SELECT DISTINCT(ORIGIN) FROM flights ORDER BY ORIGIN ASC");

color squareColor = color(200);


Button date = new Button(40, 70, 450, 30, "Enter date and time in dd/mm/yyyy hh:mm format",30);
Button origin = new Button(500, 70, 100, 30, "Origin",30);
Scrollbar bar;
int offset = 0;
Checkbox cancelled = new Checkbox(610, "Cancelled");

PImage plane;
//Button addFilter = new Button(50, 300, 100, 50, "Add filters:", 30);
Button search = new Button(SCREENX/2, SCREENY/2, 300, 50, "SEARCH", 30);
Button searchDes = new Button(SCREENX/3-75, 150, 370, 70, "Search by destination", 30);
Button graph = new Button(SCREENX/2+10, SCREENY/2, 50, 50, "graph",30);
Button back = new Button(40, 10, 100, 50, "Back",30);
PFont  font;

String userInputDestination="";
String userInputDate = "";
boolean change = false;


void settings() {
  size(SCREENX,SCREENY);
}
void setup()
{
  plane=loadImage("aereo.jpg");
  font = loadFont("PoorRichard-Regular-30.vlw");
  textFont(font);
  noStroke();
  DatabaseQueries.dbPath = sketchPath("database.db");
  originAirports = db.query("SELECT DISTINCT(ORIGIN) FROM flights ORDER BY ORIGIN ASC");
  System.out.println(originAirports);


  screens.add (new Screen(color(#D3DCEE)));
  screens.add (new Screen(color(#D3DCEE)));
  screens.add (new Screen(color(#D3DCEE)));
  screens.add (new Screen(color(#D3DCEE)));


 // screens.get(0).addButton(addFilter);
  screens.get(0).addButton(search);
  screens.get(0).addButton(searchDes);
  screens.get(0).addButton(graph);

  
  //screens.get(1).addButton(back);
  screens.get(0).addButton(date);
  screens.get(0).addButton(origin);
  screens.get(0).addCheckbox(cancelled);
  screens.get(0).addButton(graph);

  screens.get(2).addButton(back);

  screens.get(3).addButton(back);

  theScreen = screens.get(0);

  for(int i = 0; i < originAirports.size(); i++){
    origins.add(new Checkbox(510, originAirports.get(i).get(0)));
  }
  bar = new Scrollbar(800 - 8, 110, 16, 505, 16);
}

void draw() {
  plane.resize(SCREENX/3,100);
  image (plane, -plane.width, 0);
  
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
 // else if (addFilter.clicked(mouseX, mouseY)) {
  //  theScreen = screens.get(1);
  //} 
  else if (graph.clicked(mouseX, mouseY)) {
    theScreen = screens.get(3);
    screens.get(3).addBarchart(new Barchart(SCREENX/2, SCREENY/2, 800, 600, 60, origins));
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
}

void mouseMoved() {
  for (Button b : theScreen.button) {
    if (b.clicked(mouseX, mouseY)) b.stroke = true;
    else b.stroke = false;
  }
}

