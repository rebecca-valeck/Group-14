 class Button {
  float x, y, w, h, r;
  String label;
  boolean stroke = false;

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
    
    fill(180);
    rect(x, y, w, h, r);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(40);
    text(label, x+w/2, y+h/2);
  }

  boolean clicked(float mx, float my) {
    return mx > x && mx < x+w && my > y && my < y+h;
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