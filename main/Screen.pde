class Screen {

  ArrayList<Button> button = new ArrayList<Button>();
  color backgroudColor ;

  Screen (color backgroudColor){
    this.backgroudColor=backgroudColor;
  }
  
  
  void addButton(Button b) {
    button.add(b);
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

  }


  Button getEvent()
  {
    for (Button b : button) {
      if (b.clicked(mouseX, mouseY)) return b;
    }
    return null;
  }
}