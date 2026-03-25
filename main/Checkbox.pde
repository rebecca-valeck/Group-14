class Checkbox {
    float x, y = 0;
    int w = 20;
    int h = 20;
    String label;
    boolean checked = false;

    Checkbox(float x, String str){
        this.x = x;
        label = str;
    }

    void draw(float y){
        this.y = y;
        stroke(0);
        fill(255);
        rect(x, y, w, h);

        fill(0);
        textSize(h);
        textAlign(LEFT, CENTER);
        text(label, x+w+5, y+h/2);

        if (checked){
            textAlign(CENTER,CENTER);
            fill(0);
            textSize(h);
            text("X", x + w/2, y+h/2);
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