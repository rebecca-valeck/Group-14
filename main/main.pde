import java.util.Arrays;
final int SCREENX = 1280;
final int SCREENY = 720;

DatabaseQueries db = new DatabaseQueries();
Barchart chart;
Screen theScreen;
Calendar dayCalendar;
Calendar monthCalendar;
ArrayList<Screen> screens = new ArrayList<Screen>();
ArrayList<Checkbox> origins = new ArrayList<Checkbox>();
ArrayList<Checkbox> destins = new ArrayList<Checkbox>();
ArrayList<Calendar> dates = new ArrayList<Calendar>();
ArrayList<Calendar> months = new ArrayList<Calendar>();
boolean twentyEightDays;
boolean thirtyDays;
ArrayList<ArrayList<String>> originAirports; //= db.query("SELECT DISTINCT(ORIGIN) FROM flights ORDER BY ORIGIN ASC");
ArrayList<ArrayList<String>> destAirports; //= db.query("SELECT DISTINCT(DEST) FROM flights ORDER BY DEST ASC");

color squareColor = color(200);

Button day;
Button month ;
Button origin ;
Button destination ;
Button search;
//Button graph;
Button back;

TextButton depTime;
TextButton arrTime;
TextButton distance;


Scrollbar bar;
Scrollbar dbar;
Checkbox cancelled = new Checkbox(1005, "Cancelled");
Checkbox diverted = new Checkbox(1125, "Diverted");

PFont  font;
int monthNumber;
int dayNumber;

PImage plane;
MovingImage movplaneimg;
String userInputDestination="";
boolean change = false;

Simulation sim;

void settings() {
  size(SCREENX,SCREENY);
  size(SCREENX,SCREENY);
}
void setup()
{
  sim = new Simulation();
  plane=loadImage("aereo.jpg");
  plane.resize(1480, 100);
  movplaneimg = new MovingImage(plane, plane.width * -1, 0);
  font = loadFont("PoorRichard-Regular-30.vlw");
  textFont(font);
  noStroke();
  db.dbPath = sketchPath("database.db");
  originAirports = db.query("SELECT DISTINCT(ORIGIN_CITY_NAME) FROM flights ORDER BY ORIGIN_CITY_NAME ASC");
  destAirports = db.query("SELECT DISTINCT(DEST_CITY_NAME) FROM flights ORDER BY DEST_CITY_NAME ASC");
  System.out.println(originAirports);
  System.out.println(destAirports);


  search = new Button(SCREENX/2-150, SCREENY/2-25, 300, 50, "G E N E R A T E   M A P", 30);
  //graph = new Button(SCREENX/3+10, SCREENY/2, 50, 50, "graph",30);
  back = new Button(40, 25, 100, 50, "BACK",30);


  day = new Button(50, (SCREENY/4)-50, 75, 30, "Day", 30);
  month = new Button(155, (SCREENY/4)-50, 80, 30, "Month",30);
  origin = new Button(265, (SCREENY/4)-50, 90, 30, "Origin", 30);
  destination = new Button(380, (SCREENY/4)-50, 120, 30, "Destination", 30);

  depTime = new TextButton(530, (SCREENY/4)-50, 150, 30, "Departure time", 30);
  arrTime = new TextButton(710, (SCREENY/4)-50, 130, 30, "Arrival time", 30);
  distance = new TextButton(870, (SCREENY/4)-50, 100, 30, "Distance", 30);


  search = new Button(SCREENX/2-150, SCREENY/2-25, 300, 50, "G E N E R A T E   M A P", 30);
 // graph = new Button(SCREENX/3+10, SCREENY/2, 50, 50, "graph",30);
  back = new Button(40, 25, 100, 50, "BACK",30);


  day = new Button(50, (SCREENY/4)-50, 75, 30, "Day", 30);
  month = new Button(155, (SCREENY/4)-50, 80, 30, "Month",30);
  origin = new Button(265, (SCREENY/4)-50, 90, 30, "Origin", 30);
  destination = new Button(380, (SCREENY/4)-50, 120, 30, "Destination", 30);

  depTime = new TextButton(530, (SCREENY/4)-50, 150, 30, "Departure time", 30);
  arrTime = new TextButton(710, (SCREENY/4)-50, 130, 30, "Arrival time", 30);
  distance = new TextButton(870, (SCREENY/4)-50, 100, 30, "Distance", 30);


  screens.add (new Screen(color(#D3DCEE)));
  screens.add (new Screen(color(#D3DCEE)));
  screens.add (new Screen(color(#2E5E8E)));
  screens.add (new Screen(color(#D3DCEE)));


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
  screens.get(1).addButton(back);


  screens.get(3).addButton(back);

  theScreen = screens.get(0);
  dayCalendar = new Calendar(10,170,250,350, 0);
  monthCalendar = new Calendar(155,170,150,200, 0);

  for(int i = 0; i < originAirports.size(); i++){
    origins.add(new Checkbox(183, originAirports.get(i).get(0)));
  }
  bar = new Scrollbar(460, (SCREENY/4)-15, 16, 505, 16);
  for(int i = 0; i < destAirports.size(); i++){
    destins.add(new Checkbox(300, destAirports.get(i).get(0)));
  }
  dbar = new Scrollbar(582, (SCREENY/4)-15, 16, 505, 16);

  for(int row = 0; row < 4; row++)
  {
    for(int column = 0; column < 3; column++)
    {
    months.add(new Calendar(155 + (column * 50), 170 + (50*row), 50, 50, column + 1 + (3*row)));
    }
  }
}
void draw() {
  
  theScreen.draw();

  if(origin.checked){
    fill(#F1F4F9);
    stroke(0);
    rect(173, (SCREENY/4)-15, 290, 505, 5);

    int i = (int)(bar.getPos() / (bar.sh/(origins.size()-20))*0.70 -120);
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
    fill(#F1F4F9);
    stroke(0);
    rect(290, (SCREENY/4)-15, 290, 505, 5);

    int i = (int)(dbar.getPos() / (dbar.sh/(destins.size()-20))*0.70 -120);
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
  
  if(day.checked)
 {
  dayCalendar.draw();
  
  
  for (Calendar c: dates)
  {
    
    c.drawDates(c.x, c.y);
    
    if(c.checked)
    {
      dayNumber = c.date;
      stroke(0);
      line(c.x, c.y, c.x + 50, c.y+50);
      line(c.x, c.y + 50, c.x + 50, c.y);
    }
  }
  
 }
 
 if(month.checked)
 {
   for (Calendar c: months)
  {
    
    c.drawDates(c.x, c.y);
    
    if(c.checked)
    {
      monthNumber = c.date;
      stroke(0);
      line(c.x, c.y, c.x + 50, c.y+50);
      line(c.x, c.y + 50, c.x + 50, c.y);
      if(c.date == 2)
      {
        twentyEightDays = true;
        thirtyDays = false;
      }
      else if(c.date == 4 || c.date == 6 || c.date == 9 || c.date == 11)
      {
         twentyEightDays = false;
         thirtyDays = true;         
      }
      else
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
  
  if(back.clicked(mouseX, mouseY)){
    theScreen = screens.get(0);
    origin.checked = false;
    destination.checked = false;
  } 
  else if (search.clicked(mouseX, mouseY)) {
    theScreen = screens.get(1);
    origin.checked = false;
    destination.checked = false;
    
    String date = dayNumber +"/" + monthNumber+"/2022 12:00:00 AM" ;
    movplaneimg.x = movplaneimg.initialx;
    screens.get(1).addBarchart(new Barchart(SCREENX/2+400, 240, 400, 200, 60,
                               origins,destins,date,
                               distance.label,
                               arrTime.label,
                               depTime.label,
                              "ORIGIN_CITY_NAME",
                              "DEST"));
        screens.get(1).addBarchart(new Barchart(SCREENX/2+400, 530, 400, 300, 60,
                               origins,destins,date,
                               distance.label,
                               arrTime.label,
                               depTime.label,
                              "DEST_CITY_NAME",
                              "ORIGIN"));
    } 

  else if (depTime.clicked(mouseX, mouseY)) {
    origin.checked = false;
    destination.checked = false;
  }
  else if (distance.clicked(mouseX, mouseY)) {
    origin.checked = false;
    destination.checked = false;
  }
  else if (arrTime.clicked(mouseX, mouseY)) {
    origin.checked = false;
    destination.checked = false;
  }
  else if (origin.clicked(mouseX, mouseY)){
    destination.checked = false;
    day.checked = false;
    month.checked = false;
  }
  else if (destination.clicked(mouseX, mouseY)){
    origin.checked = false;
    day.checked = false;
    month.checked = false;
  }

    else if (day.clicked(mouseX, mouseY))
  {
    origin.checked = false;
    destination.checked = false;
    month.checked = false;
  }
  
  else if (month.clicked(mouseX, mouseY))
  {
    origin.checked = false;
    destination.checked = false;
    day.checked = false;
  }


 
  
  for (Checkbox c: origins){
    c.clicked(mouseX, mouseY);
  }
  for (Checkbox c: destins){
    c.clicked(mouseX, mouseY);
  }

  for (Calendar c: dates)
  {
    c.clicked(mouseX, mouseY, day);
  }
  for(Calendar c: months)
  {
    c.clicked(mouseX,mouseY, month);
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

void setDates()
{
  dates.clear();
  if(twentyEightDays)
  {
    for(int row = 0; row < 5; row++)
    {
      for(int column = 0; column < 5; column++)
      {
        dates.add(new Calendar(10 + (column * 50), 170 + (50*row), 50, 50, column + 1 + (5*row)));
      }
    }
    dates.add(new Calendar(10, 420, 50, 50, 26));
    dates.add(new Calendar(60, 420, 50, 50, 27));
    dates.add(new Calendar(110, 420, 50, 50, 28));
  }
  else if(thirtyDays)
  {
    for(int row = 0; row < 6; row++)
    {
      for(int column = 0; column < 5; column++)
      {
        dates.add(new Calendar(10 + (column * 50), 170 + (50*row), 50, 50, column + 1 + (5*row)));
      }
    }
  }
  
  else
  {
    for(int row = 0; row < 6; row++)
    {
      for(int column = 0; column < 5; column++)
      {
        dates.add(new Calendar(10 + (column * 50), 170 + (50*row), 50, 50, column + 1 + (5*row)));
      }
    }
    dates.add(new Calendar(10, 470, 50, 50, 31));
  }
}

