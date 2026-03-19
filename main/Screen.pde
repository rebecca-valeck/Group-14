class Screen {

  ArrayList<Button> button = new ArrayList<Button>();
  ArrayList<Barchart> charts = new ArrayList<Barchart>();

  color backgroudColor ;

  Screen (color backgroudColor){
    this.backgroudColor=backgroudColor;
  }
  
  
  void addButton(Button b) {
    button.add(b);
  }

  void addBarchart(Barchart c){
    charts.add(c);
  }
  void draw() {
    
    background(backgroudColor);
    textSize(20);

     String s = "Search planes!";
    fill(0);
    text(s, 500, 5, 300, 100);  
    for (Button b : button)
    {
      b.draw();
    }

    for ( Barchart c: charts)
    {
      c.draw();
    }

  }


  Button getEvent()
  {
    for (Button b : button) {
      if (b.clicked(mouseX, mouseY)) return b;
    }
    return null;
  }
}