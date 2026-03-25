class Screen {

  ArrayList<Button> button = new ArrayList<Button>();
  ArrayList<TextButton> textbutton = new ArrayList<TextButton>();

  ArrayList<Barchart> charts = new ArrayList<Barchart>();
  ArrayList<Checkbox> checks = new ArrayList<Checkbox>();
  color backgroudColor ;

  Screen (color backgroudColor){
    this.backgroudColor=backgroudColor;
  }
  
  
  void addButton(Button b) {
    button.add(b);
  }
  void addTextButton(TextButton t) {
    textbutton.add(t);
  }

  void addBarchart(Barchart c){
    charts.add(c);
  }

  void addCheckbox(Checkbox c){
    checks.add(c);
  }

  void draw() {
    
    background(backgroudColor);
    fill(#2E5E8E);
    rect(0, 0, 1900, 100);
    
    textSize(60);
    String s = "S E A R C H   P L A N E S !";
    fill(#D3DCEE);
    textAlign(CENTER, CENTER);
    text(s, 0, 0, width, 100);  
    textSize(20);
    for (Button b : button)
    {
      b.draw();
    }

     for (TextButton t : textbutton)
    {
      t.draw();
    }

    for ( Barchart c: charts)
    {
      c.draw();
    }

    for (Checkbox c: checks){
      c.draw((SCREENY/4)-45);
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