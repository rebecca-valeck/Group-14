
void keyPressed() {
  String newl =" ";
  String oldl =" ";
  

  if (theScreen.getEvent().label == "| " ) {
    newl = str(key);
    theScreen.getEvent().label = newl;
    println(key);
  }
  if (newl==oldl) {
    oldl=newl;
    newl = str(key);
    theScreen.getEvent().label += newl;
    println(key);
    userInputDestination = theScreen.getEvent().label;
  }
  
}