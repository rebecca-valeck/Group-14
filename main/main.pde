import java.util.Arrays;
final int SCREENX = 1280;
final int SCREENY = 720;

DatabaseQueries db = new DatabaseQueries();
Barchart chart;
//Map insertation
PImage bg;
PImage planeImage;

Screen theScreen;

Calendar dayCalendar;
Calendar monthCalendar;

ArrayList<Screen> screens = new ArrayList<Screen>();
ArrayList<Checkbox> origins = new ArrayList<Checkbox>();
ArrayList<Checkbox> destins = new ArrayList<Checkbox>();
ArrayList<String> selectedDates = new ArrayList<String>();
ArrayList<Calendar> dates = new ArrayList<Calendar>();
ArrayList<Calendar> months = new ArrayList<Calendar>();

ArrayList<ArrayList<String>> originAirports; //= db.query("SELECT DISTINCT(ORIGIN) FROM flights ORDER BY ORIGIN ASC");
ArrayList<ArrayList<String>> destAirports; //= db.query("SELECT DISTINCT(DEST) FROM flights ORDER BY DEST ASC");

// Calendar booleans for days based on month selected
boolean twentyEightDays;
boolean thirtyDays;

//creating all the buttons 
Button day;
Button month ;
Button origin ;
Button destination ;
Button search;
// Button back;

//all the text buttons
TextButton depTime;
TextButton arrTime;
TextButton distance;
TextButton lateness;


//all the scrollbar
Scrollbar bar;
Scrollbar dbar;

//the check boxes
Checkbox cancelled = new Checkbox(1025, "Cancelled");
Checkbox diverted = new Checkbox(1145, "Diverted");

// font and images
PFont  font;

int monthNumber =0;
int dayNumber =0;

PImage plane;
MovingImage movplaneimg;
PImage girlImg;
MovingImage girl;
PImage guyBookImg;
MovingImage guyBook;
PImage guySuitcaseImg;
MovingImage guySuitcase;
PImage yippeeImg;
MovingImage yippee;
PImage kidsImg;
MovingImage kids;
PImage penguin;
String userInputDestination="";
boolean change = false;

PImage logoImg;
Logo logo;

Simulation sim ;
void settings() {
 size(SCREENX,SCREENY); 
  pixelDensity(1);
}

void setup()
{
  sim = new Simulation();
  bg = loadImage("final.svg.jpg");
  planeImage = loadImage("plane.png");

  sim = new Simulation();
  plane=loadImage("aereo.jpg");
  plane.resize(1480, 100);
  movplaneimg = new MovingImage(plane, plane.width * -1, 0, 15);
  girlImg = loadImage("girl.jpg");
  girlImg.resize(130, 150);
  girl = new MovingImage(girlImg, 70, 550, -5);
  guyBookImg = loadImage("guyBook.jpg");
  guyBookImg.resize(80, 150);
  guyBook = new MovingImage(guyBookImg, 200, 550, -5);
  guySuitcaseImg = loadImage("guySuicase.jpg");
  guySuitcaseImg.resize(120, 150);
  guySuitcase = new MovingImage(guySuitcaseImg, 620, 550, -5);
  yippeeImg = loadImage("yippe.jpg");
  yippeeImg.resize(130, 150);
  yippee = new MovingImage(yippeeImg, 370, 550, -5);
  kidsImg = loadImage("kids.jpg");
  kidsImg.resize(190, 150);
  kids = new MovingImage(kidsImg, 1000, 390, -10);
  penguin = loadImage("penguin.gif");
  penguin.resize(60,60);
  
  logoImg = loadImage("logo.jpeg");

  // creating the logo
  logo = new Logo(logoImg, 20, 15);
  
  //loading the font 
  font = loadFont("PoorRichard-Regular-30.vlw");
  textFont(font);
  noStroke();

  //database
  db.dbPath = sketchPath("database.db");
  originAirports = db.query("SELECT DISTINCT(ORIGIN_CITY_NAME) FROM flights ORDER BY ORIGIN_CITY_NAME ASC");
  destAirports = db.query("SELECT DISTINCT(DEST_CITY_NAME) FROM flights ORDER BY DEST_CITY_NAME ASC");


  search = new Button(SCREENX/2-150, SCREENY/2-25, 300, 50, "G E N E R A T E   M A P", 30);
 

  month = new Button(20, (SCREENY/4)-50, 80, 30, "Month", 30);
  day = new Button(120, (SCREENY/4)-50, 75, 30, "Day", 30);
  origin = new Button(215, (SCREENY/4)-50, 90, 30, "Origin", 30);
  destination = new Button(325, (SCREENY/4)-50, 120, 30, "Destination", 30);

  depTime = new TextButton(465, (SCREENY/4)-50, 150, 30, "Departure time", 30);
  arrTime = new TextButton(635, (SCREENY/4)-50, 130, 30, "Arrival time", 30);
  distance = new TextButton(785, (SCREENY/4)-50, 100, 30, "Distance", 30);
  lateness = new TextButton(905, (SCREENY/4)-50, 100, 30, "Lateness", 30);

  search = new Button(SCREENX/2-150, SCREENY/2-25, 300, 50, "G E N E R A T E   M A P", 30);

  screens.add (new Screen(color(#D3DCEE)));
  screens.add (new Screen(color(#D3DCEE)));
  screens.add (new Screen(color(#2E5E8E)));
  screens.add (new Screen(color(#D3DCEE)));


  //adding to the home screen
  screens.get(0).addButton(search);


  screens.get(0).addButton(day);
  screens.get(0).addButton(month);

  screens.get(0).addButton(origin);
  screens.get(0).addCheckbox(cancelled);
  screens.get(0).addCheckbox(diverted);

  screens.get(0).addTextButton(depTime);
  screens.get(0).addTextButton(arrTime);
  screens.get(0).addButton(destination);
  screens.get(0).addTextButton(distance);
  screens.get(0).addTextButton(lateness);




  theScreen = screens.get(0);
  dayCalendar = new Calendar(120, 170, 250, 350, 0);
  monthCalendar = new Calendar(20, 170, 150, 200, 0);

  for (int i = 0; i < originAirports.size(); i++) {
    origins.add(new Checkbox(183, originAirports.get(i).get(0)));
  }

  //adding scrollbar
  bar = new Scrollbar(460, (SCREENY/4)-15, 16, 505, 16);
  for (int i = 0; i < destAirports.size(); i++) {
    destins.add(new Checkbox(300, destAirports.get(i).get(0)));
  }
  dbar = new Scrollbar(582, (SCREENY/4)-15, 16, 505, 16);

  for (int row = 0; row < 4; row++)
  {
    for (int column = 0; column < 3; column++)
    {
      months.add(new Calendar(20 + (column * 50), 170 + (50*row), 50, 50, column + 1 + (3*row)));
    }
  }
}
void draw() {

  theScreen.draw();

  logo.draw();

if (origin.checked) {
    fill(#F1F4F9);
    stroke(0);
    rect(173, (SCREENY/4)-15, 290, 505, 5);

    // 1. Get scroll percentage (0.0 to 1.0)
    float ratio = bar.getPos() / (float)bar.sh; 
    
    // 2. Map ratio directly to the list. 
    // This removes the '-120' which was skipping ABQ.
    int startIndex = int(ratio * (origins.size() - 20) - 32);
    
    // 3. Constrain ensures we start exactly at index 0 (ABQ)
    startIndex = constrain(startIndex, 0, max(0, origins.size() - 20));

    for (int j = 0; j < 20 && (startIndex + j) < origins.size(); j++) {
        origins.get(startIndex + j).draw(170 + (j * 25));
    }

    bar.update();
    bar.draw();
  }
  
 if (destination.checked) {
    fill(#F1F4F9);
    stroke(0);
    // Destination box should be at X: 290 to not overlap Origin
    rect(290, (SCREENY/4)-15, 290, 505, 5); 

    // 1. Use dbar for Destination
    float ratio = dbar.getPos() / (float)dbar.sh; 
    
    // 2.
    int startIndex = int(ratio * (destins.size() - 20)-32);
    
    // 3. Constrain ensures a perfect start and finish
    startIndex = constrain(startIndex, 0, max(0, destins.size() - 20));

    for (int j = 0; j < 20 && (startIndex + j) < destins.size(); j++) {
        destins.get(startIndex + j).draw(170 + (j * 25));
    }

    dbar.update();
    dbar.draw();
  }

  // draws Calendar, dates, months and filters with dates
  if (day.checked)
  {
    dayCalendar.draw();


    for (Calendar c : dates)
    {

      c.drawDates(c.x, c.y);

      if (c.checked)
      {
        if(!selectedDates.contains(monthNumber +"/" + c.date+"/2022 12:00:00 AM"))selectedDates.add(monthNumber +"/" + c.date+"/2022 12:00:00 AM");
        stroke(0);
        line(c.x, c.y, c.x + 50, c.y+50);
        line(c.x, c.y + 50, c.x + 50, c.y);
      }
    }
  }

  if (month.checked)
  {
    for (Calendar c : months)
    {

      c.drawDates(c.x, c.y);

      if (c.checked)
      {
        monthNumber = c.date;
        stroke(0);
        line(c.x, c.y, c.x + 50, c.y+50);
        line(c.x, c.y + 50, c.x + 50, c.y);
        if (c.date == 2)
        {
          twentyEightDays = true;
          thirtyDays = false;
        } else if (c.date == 4 || c.date == 6 || c.date == 9 || c.date == 11)
        {
          twentyEightDays = false;
          thirtyDays = true;
        } else
        {
          twentyEightDays = false;
          thirtyDays = false;
        }

        setDates();
      }
    }
  }
}

void mousePressed()
{

  if (logo.clicked(mouseX, mouseY)) {
    theScreen = screens.get(0);
    origin.checked = false;
    destination.checked = false;
  } else if (search.clicked(mouseX, mouseY)) {
    sim.addPlanes(db.filteredQuery(origins,destins,selectedDates,distance.label,arrTime.label,depTime.label,"SELECT * FROM flights WHERE "," LIMIT 50"));
    sim.graph.generateAirportLocations(sim.planes, 20, 100, 620, 400);
    theScreen = screens.get(1);
    origin.checked = false;
    destination.checked = false;
    day.checked = false;
    month.checked = false;

    // Reset simulation and add the map to the simulation draw loop
    

    movplaneimg.x = movplaneimg.initialx;
    screens.get(1).addBarchart(new Barchart(SCREENX/2+400, 240, 400, 200, 60,
       db.filteredQuery(origins,destins,selectedDates,distance.label,arrTime.label,depTime.label,"SELECT DEST_CITY_NAME,(ARR_TIME - CRS_ARR_TIME) FROM flights WHERE (CANCELLED = 0)  AND (ARR_TIME - CRS_ARR_TIME < 2300) AND "," ORDER BY (ARR_TIME - CRS_ARR_TIME) DESC LIMIT 6"),
      "DEST_CITY_NAME"));
    screens.get(1).addBarchart(new Barchart(SCREENX/2+400, 530, 400, 300, 60,
       db.filteredQuery(origins,destins,selectedDates,distance.label,arrTime.label,depTime.label,"SELECT ORIGIN,COUNT(*) FROM flights WHERE "," GROUP BY ORIGIN ORDER BY COUNT(*) DESC LIMIT 6"),
      "DEST_CITY_NAME"));
  } else if (depTime.clicked(mouseX, mouseY)) {
    origin.checked = false;
    destination.checked = false;
  } else if (distance.clicked(mouseX, mouseY)) {
    origin.checked = false;
    destination.checked = false;
  } else if (arrTime.clicked(mouseX, mouseY)) {
    origin.checked = false;
    destination.checked = false;
  } else if (origin.clicked(mouseX, mouseY)) {
    destination.checked = false;
    day.checked = false;
    month.checked = false;
  } else if (destination.clicked(mouseX, mouseY)) {
    origin.checked = false;
    day.checked = false;
    month.checked = false;
  } else if (day.clicked(mouseX, mouseY))
  {
    origin.checked = false;
    destination.checked = false;
    month.checked = false;
  } else if (month.clicked(mouseX, mouseY))
  {
    origin.checked = false;
    destination.checked = false;
    day.checked = false;
  } else if (lateness.clicked(mouseX, mouseY)){
    origin.checked = false;
    destination.checked = false;
  }




  for (Checkbox c : origins) {
    c.clicked(mouseX, mouseY);
  }
  for (Checkbox c : destins) {
    c.clicked(mouseX, mouseY);
  }

  for (Calendar c : dates)
  {
    c.clicked(mouseX, mouseY, day);
  }
  for (Calendar c : months)
  {
    c.clicked(mouseX, mouseY, month);
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
// based on what months are selected, sets the amount of dates that are shown
// e.g. February selected = 28 dates shown
void setDates()
{
  dates.clear();
  if (twentyEightDays)
  {
    for (int row = 0; row < 5; row++)
    {
      for (int column = 0; column < 5; column++)
      {
        dates.add(new Calendar(120 + (column * 50), 170 + (50*row), 50, 50, column + 1 + (5*row)));
      }
    }
    dates.add(new Calendar(120, 420, 50, 50, 26));
    dates.add(new Calendar(170, 420, 50, 50, 27));
    dates.add(new Calendar(220, 420, 50, 50, 28));
  } else if (thirtyDays)
  {
    for (int row = 0; row < 6; row++)
    {
      for (int column = 0; column < 5; column++)
      {
        dates.add(new Calendar(120 + (column * 50), 170 + (50*row), 50, 50, column + 1 + (5*row)));
      }
    }
  } else
  {
    for (int row = 0; row < 6; row++)
    {
      for (int column = 0; column < 5; column++)
      {
        dates.add(new Calendar(120 + (column * 50), 170 + (50*row), 50, 50, column + 1 + (5*row)));
      }
    }
    dates.add(new Calendar(120, 470, 50, 50, 31));
  }
  
}
