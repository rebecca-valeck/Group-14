class MovingImage{
    float x, y, initialx;
    PImage img;

    MovingImage (PImage img, float x, float y){
        this.x = x;
        this.y = y;
        this.img = img;
        initialx = x;
    }

    void drawImg(){
        image (img, x, y);
    }

    void moveImg(){
        if (x < 0){
            x += 15;
        }
        else x = 0;
    }
}