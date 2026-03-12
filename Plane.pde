class Plane {
    float x_origin_coord;
    float y_origin_coord;
    float x_dest_coord;
    float y_dest_coord;

    Plane( float x_origin_coord, float y_origin_coord, float x_dest_coord, float y_dest_coord) {
        this.x_origin_coord = x_origin_coord;
        this.y_origin_coord = y_origin_coord;
        this.x_dest_coord = x_dest_coord;
        this.y_dest_coord = y_dest_coord;

    }

    void draw(){
        circle(x_origin_coord, y_origin_coord, 10);
    }

    void move(){
        if (x_origin_coord < x_dest_coord) {
            x_origin_coord += 0.2;
        } else if (x_origin_coord > x_dest_coord) {
            x_origin_coord -= 0.2;
        }

        if (y_origin_coord < y_dest_coord) {
            y_origin_coord += 0.2;
        } else if (y_origin_coord > y_dest_coord) {
            y_origin_coord -= 0.2;
        }
    }

}