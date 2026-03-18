class Barchart{
    float x, y, w, h;
    String title, x_title, y_title;
    ArrayList<ArrayList<String>> data;
    Barchart(float x, float y, float w, float h, String title, String x_title, String y_title, ArrayList<ArrayList<String>> data){
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.title = title;
        this.x_title = x_title;
        this.y_title = y_title;
        this.data = data;
    }


    void draw(){
        fill(255);
        rect(x-w/2, y-h/2, w, h);
        for (int i = 0; i < data.size(); i++){
            float barHeight = map(float(data.get(i).get(1)), 0, float(data.get(0).get(1)), 0, h-100);
            fill(100, 150, 200);
            rect(x-w/2 + 50 + i*50, y+h/2 - barHeight - 50, 40, barHeight);
            fill(0);
            textAlign(CENTER);
            text(data.get(i).get(0), x-w/2 + 70 + i*50, y+h/2 - 30);
        }
        text( x_title, x, y + h/2 -10);
        pushMatrix();
        translate(x - w/2  + 15, y);
        rotate(-HALF_PI);
        text( y_title, 0,0);
        popMatrix();
        

    }

}