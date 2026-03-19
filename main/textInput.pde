
void keyPressed() {
  String newLetter ="";

  
  Button clickedButton = theScreen.getEvent();
  if (clickedButton.label == "| " ) {
    newLetter = str(key);
    userInputDestination = newLetter;
    clickedButton.label = userInputDestination;
  }

  else if (clickedButton.label == userInputDestination) {
    newLetter = str(key);
    userInputDestination += newLetter;
    clickedButton.label = userInputDestination;
  }
  if (key == BACKSPACE){
    userInputDestination = userInputDestination.substring(0,userInputDestination.length()-2);
    clickedButton.label = userInputDestination;
  } 
  
  
}