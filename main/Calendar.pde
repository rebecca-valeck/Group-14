class Calendar
{
    float x, y = 0;
    float boxX, boxY = 0;
    float calendarWidth;
    float calendarHeight;
    int w = 50;
    int h = 50;
    boolean checked = false;
    boolean xChecked = false;
    int date;

    Calendar(float x, float y, float calendarWidth, float calendarHeight, int date)
    {
        this.x = x;
        this.y = y;
        this.calendarWidth = calendarWidth;
        this.calendarHeight = calendarHeight;
        this.date = date;
        
    }

    void draw()
    {
      fill(#E2E8F4);
      rect(x, y, calendarWidth, calendarHeight);
      if (checked)
      {
        textAlign(CENTER,CENTER);
        fill(#E2E8F4);
        textSize(h);
        text("X", boxX+w/2 +1, boxY+h/2 +1);
      }
    }

    void drawDates(float x, float y)
    {      
      boxX = x;
      boxY = y;
      stroke(#14283E);
      fill(#E2E8F4);
      rect(boxX, boxY, w, h);

      fill(#14283E);
      textSize(20);
      textAlign(CENTER);
      text(date, x+10, y+20);

    }
        
    boolean clicked(float mx, float my, Button b)
    {
      if(mx > x && mx < x+w && my > y && my < y+h)
      {
        if (b.checked){
          if (checked) checked = false;
          else checked = true;
        }
        return true;
      }
      return false;
    }
    
}


//void setDates()
//{
//  dates.clear();
//  if (twentyEightDays)
//  {
//    for (int row = 0; row < 5; row++)
//    {
//      for (int column = 0; column < 5; column++)
//      {
//        dates.add(new Calendar(10 + (column * 50), 170 + (50*row), 50, 50, column + 1 + (5*row)));
//      }
//    }
//    dates.add(new Calendar(10, 420, 50, 50, 26));
//    dates.add(new Calendar(60, 420, 50, 50, 27));
//    dates.add(new Calendar(110, 420, 50, 50, 28));
//  } else if (thirtyDays)
//  {
//    for (int row = 0; row < 6; row++)
//    {
//      for (int column = 0; column < 5; column++)
//      {
//        dates.add(new Calendar(10 + (column * 50), 170 + (50*row), 50, 50, column + 1 + (5*row)));
//      }
//    }
//  } else
//  {
//    for (int row = 0; row < 6; row++)
//    {
//      for (int column = 0; column < 5; column++)
//      {
//        dates.add(new Calendar(10 + (column * 50), 170 + (50*row), 50, 50, column + 1 + (5*row)));
//      }
//    }
//    dates.add(new Calendar(10, 470, 50, 50, 31));
//  }
//  
//}