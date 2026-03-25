 class Button {
  float x, y, w, h, r;
  String label;
  boolean stroke = false;
  boolean checked = false;

  Button(float x, float y, float w, float h, String label, float r) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.label = label;
    this.r = r;
  }

  void draw() {
    
    if(stroke)  stroke(0);
    else noStroke();
    
    fill(#2E5E8E);
    rect(x, y, w, h, r);

    fill(#D3DCEE);
    textAlign(CENTER, CENTER);
    text(label, x+w/2, y+h/2);
  }

  boolean clicked(float mx, float my){
      if(mx > x && mx < x+w && my > y && my < y+h){
        if (mousePressed){
          System.out.print("clicked button");
          if (checked) checked = false;
          else checked = true;
        }
        return true;
      }
      return false;
  }
/*
  color getColor() {
    if (label.equals("red"))  return color(255, 0, 0);
    if (label.equals("green"))  return color(0, 255, 0);
    if (label.equals("blue"))  return color(0, 0, 255);
    return color(200);
  }*/
}

//END CLASS