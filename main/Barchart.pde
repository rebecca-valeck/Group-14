class Barchart{
    float x, y, w, h,gap;
    String title, x_title, y_title;
    ArrayList<ArrayList<String>> data;
    Barchart(float x, float y, float w, float h, float gap ,String x_title, String y_title){
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.gap = gap;
        this.title = "Flights by" + x_title;
        this.x_title = x_title;
        this.y_title = y_title;

        System.out.println((int)((w - 50) / (gap)) );
        data = db.query(
        //"SELECT MKT_CARRIER, COUNT(*) as cnt FROM flights GROUP BY MKT_CARRIER ORDER BY cnt DESC"
        "SELECT " + x_title +", COUNT(*) FROM flights GROUP BY " + x_title +" ORDER BY COUNT(*) DESC LIMIT " +  (int)((w - 50) /  gap)
    );
    }


    void draw(){


        fill(255);
        rect(x-w/2, y-h/2, w, h);
        for (int i = 0; i < data.size(); i++){
            float barHeight = map(float(data.get(i).get(1)), 0, float(data.get(0).get(1)), 0, h-100);
            fill(100, 150, 200);
            rect(x-w/2 + 50 + i*gap, y+h/2 - barHeight - 50, 40, barHeight);
            fill(0);
            textAlign(CENTER);
            text(data.get(i).get(0), x-w/2 + 70 + i*gap, y+h/2 - 30);
        }
        text( x_title, x, y + h/2 -10);
        pushMatrix();
        translate(x - w/2  +30, y);
        rotate(-HALF_PI);
        text( y_title, 0,0);
        popMatrix();
        

    }

}