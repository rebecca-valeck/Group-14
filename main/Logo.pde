class Logo{
    PImage limg;
    int w = 70;
    int x, y;

    Logo(PImage limg, int x, int y){
        this.limg = limg;
        this.x = x;
        this.y = y;
    }

    void draw(){
        limg.resize(w, w);
        stroke(#14283E);
        image(limg, x, y);
    }

        boolean clicked(float mx, float my)
    {
      if(mx > x && mx < x+w && my > y && my < y+w)
      {
        return true;
      }
      return false;
    }
}