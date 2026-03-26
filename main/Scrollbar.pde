class Scrollbar{
    int x, y, sw, sh, miny, maxy, loose;
    float slidery, newy, ratio;
    boolean over, locked;

    Scrollbar(int x, int y, int sw, int sh, int loose){
        this.sw = sw;
        this.sh = sh;
        ratio = (float)sh / (float)(sh - sw);
        this. x = x - sw/2;
        this.y = y;
        slidery = y;
        newy = slidery;
        miny = y;
        maxy = y + sh - sw;
        this.loose = loose;
    }

    void update(){
        if (over()) over = true;
        else over = false;

        if (mousePressed && over) locked = true;
        if (!mousePressed) locked = false;

        if (locked) newy = constrain(mouseY-sw/2, miny, maxy);
        if (abs(newy - slidery) > 1) slidery = slidery + (newy - slidery)/loose;
    }


    int constrain(int val, int minv, int maxv) {
        return min(max(val, minv), maxv);
    }

    boolean over(){
        if (mouseX > x && mouseX < x + sw &&
            mouseY > y && mouseY < y + sh) {
            return true;
        }
        return false;
    }

    void draw(){
        fill(#89A1D1);
        rect(x, y, sw, sh, 5);

        if(over || locked){
            fill(#D3DCEE);
        }
        else fill(#B6C5E2);
        rect(x, slidery, sw, sw, 5);
    }
    
    float getPos(){
        return slidery * ratio;
    }
}