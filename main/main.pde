
 color squareColor = color(200);
ArrayList<Screen> screens = new ArrayList<Screen>();
Screen theScreen;
DatabaseQueries db = new DatabaseQueries();

void setup()
{
  size(1920, 1080);

  DatabaseQueries.dbPath = sketchPath("database.db");
  System.out.println(db.query("SELECT flight_id,date FROM flights WHERE flight_id > 1960"));
  

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

  theScreen.draw();
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