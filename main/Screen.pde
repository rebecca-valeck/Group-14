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
    
    fill(#2E5E8E);
    rect(0, 0, 1900, 100);

    String s = "S E A R C H  P L A N E S !";
    fill(#D3DCEE);
    textAlign(CENTER, CENTER);
    textSize(60);
    text(s, SCREENX/2-200, 50);  

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