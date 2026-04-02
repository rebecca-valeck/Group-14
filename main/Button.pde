 class Button {
  float x, y, w, h, r;
  String label;
  boolean stroke = false;
  boolean checked = false;
  boolean change = false;

  Button(float x, float y, float w, float h, String label, float r) 
  {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.label = label;
    this.r = r;
  }

  void draw() 
  {
    //If you are hovering over the button it chnges color and put strokes in the borders
    if(stroke)
    {
      stroke(#14283E);
      fill(#568FC8);
      rect(x, y, w, h, r);
    }  
    //goes back to default graphics
    else
    { 
      noStroke();
      fill(#2E5E8E);
      rect(x, y, w, h, r);
    }
    
    //put the text in the center of the button 
    fill(#D3DCEE);
    textAlign(CENTER, CENTER);
    text(label, x+w/2, y+h/2);

    
  }

  //function used to check if the button is pressed 
  boolean clicked(float mx, float my)
  {
    if(mx > x && mx < x+w && my > y && my < y+h)
    {
      if (mousePressed)
      {
        System.out.print("clicked button");
        if (checked) checked = false;
        else checked = true;
      }
      return true;
    }
    return false;
  }

}
