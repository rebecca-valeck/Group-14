import java.util.Arrays;
final int SCREENX = 1280;
final int SCREENY = 720;

DatabaseQueries db = new DatabaseQueries();
Barchart chart;
Screen theScreen;
ArrayList<Screen> screens = new ArrayList<Screen>();
ArrayList<Checkbox> origins = new ArrayList<Checkbox>();
ArrayList<Checkbox> destins = new ArrayList<Checkbox>();
ArrayList<ArrayList<String>> originAirports; //= db.query("SELECT DISTINCT(ORIGIN) FROM flights ORDER BY ORIGIN ASC");
ArrayList<ArrayList<String>> destAirports; //= db.query("SELECT DISTINCT(DEST) FROM flights ORDER BY DEST ASC");

color squareColor = color(200);


Button day = new Button(50, (SCREENY/4)-50, 75, 30, "Day", 30);
Button month = new Button(155, (SCREENY/4)-50, 80, 30, "Month", 30);

Button origin = new Button(265, (SCREENY/4)-50, 90, 30, "Origin", 30);
Button destination = new Button(380, (SCREENY/4)-50, 120, 30, "Destination", 30);
Button depTime = new Button(530, (SCREENY/4)-50, 150, 30, "Departure time", 30);
Button arrTime = new Button(710, (SCREENY/4)-50, 130, 30, "Arrival time", 30);
Button distance = new Button(870, (SCREENY/4)-50, 100, 30, "Distance", 30);



Scrollbar bar;
Scrollbar dbar;
Checkbox cancelled = new Checkbox(1005, "Cancelled");
Checkbox diverted = new Checkbox(1125, "Diverted");


PImage plane;
//Button addFilter = new Button(50, 300, 100, 50, "Add filters:", 30);

Button search = new Button(SCREENX/2-150, SCREENY/2-25, 300, 50, "G E N E R A T E   M A P", 30);

//Button searchDes = new Button((SCREENX/4)-75, 150, 370, 70, "Search by destination", 30);
Button graph = new Button(SCREENX/3+10, SCREENY/2, 50, 50, "graph",30);
Button back = new Button(40, 25, 100, 50, "BACK",30);
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
  originAirports = db.query("SELECT DISTINCT(ORIGIN_CITY_NAME) FROM flights ORDER BY ORIGIN_CITY_NAME ASC");
  destAirports = db.query("SELECT DISTINCT(DEST_CITY_NAME) FROM flights ORDER BY DEST_CITY_NAME ASC");
  System.out.println(originAirports);
  System.out.println(destAirports);


  screens.add (new Screen(color(#D3DCEE)));
  screens.add (new Screen(color(#D3DCEE)));
  screens.add (new Screen(color(#D3DCEE)));
  screens.add (new Screen(color(#D3DCEE)));


 // screens.get(0).addButton(addFilter);
  screens.get(0).addButton(search);
 // screens.get(0).addButton(searchDes);
  screens.get(0).addButton(graph);

  
  //screens.get(1).addButton(back);
  screens.get(0).addButton(day);
  screens.get(0).addButton(month);

  screens.get(0).addButton(origin);
  screens.get(0).addCheckbox(cancelled);
  screens.get(0).addCheckbox(diverted);

  screens.get(0).addButton(graph);
  screens.get(0).addButton(depTime);
  screens.get(0).addButton(arrTime);
  screens.get(0).addButton(destination);
  screens.get(0).addButton(distance);


  screens.get(2).addButton(back);

  screens.get(3).addButton(back);

  theScreen = screens.get(0);

  for(int i = 0; i < originAirports.size(); i++){
    origins.add(new Checkbox(183, originAirports.get(i).get(0)));
  }
  bar = new Scrollbar(460, (SCREENY/4)-15, 16, 505, 16);
  for(int i = 0; i < destAirports.size(); i++){
    destins.add(new Checkbox(300, destAirports.get(i).get(0)));
  }
  dbar = new Scrollbar(582, (SCREENY/4)-15, 16, 505, 16);
}
void draw() {
  //plane.resize(SCREENX/3,100);
 // image (plane, -plane.width, 0);
  
  theScreen.draw();

  if(origin.checked){
    fill(255);
    stroke(0);
    rect(173, (SCREENY/4)-15, 290, 505, 5);

    int i = ((int)bar.getPos() / (bar.sh/(origins.size()-20))-34);
    if(i < origins.size() - 21 && i >= 0){
      for (int j = 0; j <20; j++){
        origins.get(i+j).draw(170+ j * 25);
      }
    } else if (i >= origins.size()-21){
      for (int j = 0; j <20; j++){
        int index = origins.size() -20;
        origins.get(index+j).draw(170+ j * 25);
      }
    }else if (i < 0){
      for (int j = 0; j <20; j++){
        int index = 0;
        origins.get(index+j).draw(170+ j * 25);
      }
    }

    bar.update();
    bar.draw();
  }

  if(destination.checked){
    fill(255);
    stroke(0);
    rect(290, (SCREENY/4)-15, 290, 505, 5);

    int i = ((int)dbar.getPos() / (dbar.sh/(destins.size()-20))-34);
    if(i < destins.size() - 21 && i >= 0){
      for (int j = 0; j <20; j++){
        destins.get(i+j).draw(170+ j * 25);
      }
    } else if (i >= destins.size()-21){
      for (int j = 0; j <20; j++){
        int index = destins.size() -20;
        destins.get(index+j).draw(170+ j * 25);
      }
    }else if (i < 0){
      for (int j = 0; j <20; j++){
        int index = 0;
        destins.get(index+j).draw(170+ j * 25);
      }
    }

    dbar.update();
    dbar.draw();
  }
}

void mousePressed()
{

  if(back.clicked(mouseX, mouseY)){
    theScreen = screens.get(0);
    origin.checked = false;
    destination.checked = false;
  } 
  else if (search.clicked(mouseX, mouseY)) {
    theScreen = screens.get(2);
    origin.checked = false;
    destination.checked = false;
  } 
 // else if (addFilter.clicked(mouseX, mouseY)) {
  //  theScreen = screens.get(1);
  //} 
  else if (graph.clicked(mouseX, mouseY)) {
    theScreen = screens.get(3);
    origin.checked = false;
    destination.checked = false;
    screens.get(3).addBarchart(new Barchart(SCREENX/2, SCREENY/2, 800, 600, 60, origins));
  } 
  else if(origin.clicked(mouseX, mouseY)) destination.checked = false;
  else if(destination.clicked(mouseX, mouseY)) origin.checked = false;
 // else if (searchDes.clicked(mouseX, mouseY)) {
//    searchDes.label = "| ";
 // }

  for (Checkbox c: origins){
    c.clicked(mouseX, mouseY);
  }
  for (Checkbox c: destins){
    c.clicked(mouseX, mouseY);
  }
  cancelled.clicked(mouseX, mouseY);
  diverted.clicked(mouseX, mouseY);
}

void mouseMoved() {
  for (Button b : theScreen.button) {
    if (b.clicked(mouseX, mouseY)) b.stroke = true;
    else b.stroke = false;
  }
}

