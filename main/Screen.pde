class Screen {

  ArrayList<Button> button = new ArrayList<Button>();
  ArrayList<Barchart> charts = new ArrayList<Barchart>();
  ArrayList<Checkbox> checks = new ArrayList<Checkbox>();
  color backgroudColor ;

  Screen (color backgroudColor){
    this.backgroudColor=backgroudColor;
  }
  
  //funtion to add the buttons to the screen
  void addButton(Button b) {
    button.add(b);
  }

   //funtion to add the  textbuttons to the screen
  void addTextButton(TextButton t) {
    button.add(t);
  }

  //funtion to add the barchart to the screen
  void addBarchart(Barchart c){
    charts.add(c);
  }

  //funtion to add the checkboxes to the screen
  void addCheckbox(Checkbox c){
    checks.add(c);
  }

  void draw() {
    
    background(backgroudColor);
    noStroke();
    
    //creatingt the rectangle at the to of all the screens
    fill(#2E5E8E);
    rect(0, 0, 1900, 100);

    // drawing and moving the plane on the header
    if (theScreen == screens.get(1)){
      movplaneimg.drawImg();
      if(movplaneimg.x < 0) movplaneimg.moveImg();
      else movplaneimg.x = 0;
    }
    // drawing and moving the images on the main screen
    else if (theScreen == screens.get(0)){
      image(penguin, 510, 275);
      girl.drawImg();
      girl.moveImg();
      guyBook.drawImg();
      guyBook.moveImg();
      guySuitcase.drawImg();
      guySuitcase.moveImg();
      yippee.drawImg();
      yippee.moveImg();
      kids.drawImg();
      kids.moveImg();
    }

    textSize(60);
    String s = "S E A R C H   P L A N E S  !";
    fill(#D3DCEE);
    textAlign(CENTER, CENTER);
    text(s, 0, 0, width, 100);  
    textSize(20);
    for (Button b : button)
    {
      b.draw();
    }

    //drawing all the elements into the screen
    for ( Barchart c: charts)
    {
      c.draw();
    }

    for (Checkbox c: checks){
      c.draw((SCREENY/4)-45);
    }
    
    if (theScreen == screens.get(1)) sim.draw();
  }

  // returns the button that is clicked
  Button getEvent()
  {
    for (Button b : button) {
      if (b.clicked(mouseX, mouseY)) return b;
    }
    return null;
  }
  
}