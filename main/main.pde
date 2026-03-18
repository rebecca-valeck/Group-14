final int SCREENX = 1920;
final int SCREENY = 1080;
Barchart chart;
 color squareColor = color(200);
ArrayList<Screen> screens = new ArrayList<Screen>();
Screen theScreen;
DatabaseQueries db = new DatabaseQueries();

void settings() {
  size(SCREENX, SCREENY);
}
void setup()
{
  DatabaseQueries.dbPath = sketchPath("database.db");


  chart = new Barchart(
   SCREENX/2, SCREENY/2, 800, 600, 60, "ORIGIN", "Number of Flights"
  );
  

  screens.add (new Screen(color(150)));
  screens.add (new Screen(color(150)));
  screens.add (new Screen(color(150)));




  //screens.get(0).addButton(new Button(10, 10, 80, 40, "say hello!"));
  //screens.get(1).addButton(new Button(10, 10, 80, 40, "say hi"));

  theScreen = screens.get(0);

  theScreen.addButton(new Button(40, 300, 100, 50, "Add filters:"));
  theScreen.addButton(new Button(1300, 700, 100, 50, "SEARCH"));
  
  theScreen = screens.get(1);
  theScreen.addButton(new Button(40, 10, 100, 50, "Back"));


  theScreen = screens.get(2);
  theScreen.addButton(new Button(40, 10, 100, 50, "Back"));

  theScreen = screens.get(0);

  //we are going to display the map with the plane and the map

}

void draw() {

  //theScreen.draw();
  chart.draw();
}

void mousePressed()
{
  if (theScreen.getEvent()!= null) {
    if (theScreen.getEvent().label == "say hello!") println("hello");
    else if (theScreen.getEvent().label == "Back") theScreen = screens.get(0);
    else if (theScreen.getEvent().label == "Add filters:") theScreen = screens.get(1);
    else if (theScreen.getEvent().label == "say hi") println("hi!");
    else if (theScreen.getEvent().label == "SEARCH") theScreen = screens.get(2);

  }
}

void mouseMoved() {
  for (Button b : theScreen.button) {
    if (b.clicked(mouseX, mouseY)) b.stroke = true;
    else b.stroke = false;
  }
}
//END MAIN