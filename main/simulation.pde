class Simulation{
    int gameTime = 0;
    int gameTickSpeed = 1;
    ArrayList<Plane> planes = new ArrayList<Plane>();

    void start()
    {
        gameTime = 0;
    }

    void draw()
    {
        //map.draw();
        for (Plane p: planes)
        {
            //p.move();
            //p.draw();
        }
    }
    void addPlanes(ArrayList<ArrayList<String>> planesQuery){
        for (ArrayList<String> plane : planesQuery){

                planes.add(new Plane(
                plane.get(1), // date
                plane.get(4), // origin
                plane.get(6), // origin state abr
                plane.get(8), // dest
                plane.get(10), // dest state abr
                plane.get(12), // crs dept time
                plane.get(11), // dept wac
                plane.get(14), // crs arr time
                plane.get(15), // arr time
                plane.get(16), // cancelled
                plane.get(17), // diverted
                plane.get(18)  // distance
                ));
        }
    }

}