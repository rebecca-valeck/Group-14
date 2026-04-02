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

    Calendar(float x, float y, float calendarWidth, float calendarHeight, int date){
        this.x = x;
        this.y = y;
        this.calendarWidth = calendarWidth;
        this.calendarHeight = calendarHeight;
        this.date = date;
        
    }

    void draw()
    {
      fill(255);
      rect(x, y, calendarWidth, calendarHeight);
      if (checked){
            textAlign(CENTER,CENTER);
            fill(0);
            textSize(h);
            text("X", boxX+w/2 +1, boxY+h/2 +1);
        }
    }
    void drawDates(float x, float y){
        
        boxX = x;
        boxY = y;
        stroke(0);
        fill(255);
        rect(boxX, boxY, w, h);
  
        fill(0);
        textSize(20);
        textAlign(CENTER);
        text(date, x+10, y+20);
        
      
        
        
      }
        
    

    boolean clicked(float mx, float my, Button b){
      if(mx > x && mx < x+w && my > y && my < y+h){
        if (b.checked){
          if (checked) checked = false;
          else checked = true;
        }
        return true;
      }
      return false;
    }
    
}