class MovingImage
{
    float x, y, initialx, speed;
    PImage img;

    MovingImage (PImage img, float x, float y, float speed)
    {
        this.x = x;
        this.y = y;
        this.img = img;
        this.speed = speed;
        initialx = x;
    }

    void drawImg()
    {
        image (img, x, y);
    }

    // making the images move and if they are out of the screen, it resets their x position
    void moveImg()
    {
        x += speed;
        if(speed > 0){
            if(x>SCREENX) x = img.width * -1;
        }
        else{
            if(x <  (img.width * -1)) x = SCREENX;
        }
    }
}