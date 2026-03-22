class Checkbox {
    float x, y;
    int w = 20;
    int h = 20;
    String label;
    boolean checked = false;

    Checkbox(float x, float y, String str){
        this.x = x;
        this.y = y;
        label = str;
    }

    void draw(){
        stroke(0);
        fill(255);
        rect(x, y, w, h);

        fill(0);
        textSize(h);
        text(label, x+45, y+h/2);

        if (checked){
            textAlign(CENTER,CENTER);
            fill(0);
            textSize(h);
            text("x", x + w/2, y+h/2);
        }
    }

    boolean clicked(float mx, float my){
      if(mx > x && mx < x+w && my > y && my < y+h){
        if (checked) checked = false;
        else checked = true;
        return true;
      }
      return false;
    }
}