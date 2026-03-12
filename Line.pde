class Line
{   
    float cityX; float cityY;               
    float planeX; float planeY;
    
    Line(float x1, float y1, float x2, float y2) // constructor to pass in City X, Y and Plane X, Y
    {
        cityX = x1;  // assigns City X (start of line)
        cityY = y1;  // assigns City Y (start of line)
        planeX = x2; // assigns planeX (where line goes to)
        planeY = y2; // assigns planeY (where line goes to)
    }
    
    void draw()
    {
        stroke(255);
        line(cityX, cityY, planeX, planeY); // draws line from the City X and City Y to the Plane X and Plane Y
    }


}