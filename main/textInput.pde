ArrayList<String> alpha = new ArrayList<String>(Arrays.asList(" ", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "{", "|", "}"));
ArrayList<String> beta = new ArrayList<String>(Arrays.asList(" ", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", "/"));

void keyPressed() {
  String newLetter = str(key);
  Button clickedButton = theScreen.getEvent();
  FilterButton clickedFButton = theScreen.getFEvent();

  
  if (clickedButton != null){
    if (alpha.contains(newLetter)){
      if (clickedButton.label == "| "  || clickedButton.label == "" ) {
        userInputDestination = newLetter;
        clickedButton.label = userInputDestination;
      }
      else if (clickedButton.label == userInputDestination) {
        userInputDestination += newLetter;
        clickedButton.label = userInputDestination;
      }
    }
    if (key == BACKSPACE && clickedButton.label.length() > 0){
      userInputDestination = userInputDestination.substring(0,userInputDestination.length()-1);
      clickedButton.label = userInputDestination;
    } 
      if (key == ENTER ||  key == RETURN){
        theScreen = screens.get(3);
        screens.get(3).addBarchart(new Barchart(SCREENX/2, SCREENY/2, 800, 600, 60, userInputDestination, "Number of Flights"));
    } 
  }

  if (clickedFButton != null){
    if (beta.contains(newLetter)){
      if (clickedFButton.label == "|" || clickedFButton.label == "" ) {
        userInputDate = newLetter;
        clickedFButton.label = userInputDate;
      }
      else if (clickedFButton.label == userInputDate) {
        userInputDate += newLetter;
        clickedFButton.label = userInputDate;
      }
    }
    if (key == BACKSPACE && clickedFButton.label.length() > 0){
      userInputDate = userInputDate.substring(0,userInputDate.length()-1);
      clickedFButton.label = userInputDate;
    } 
      //if (key == ENTER ||  key == RETURN){
        //theScreen = screens.get(3);
        //screens.get(3).addBarchart(new Barchart(SCREENX/2, SCREENY/2, 800, 600, 60, userInputDestination, "Number of Flights"));
    //}
  }
}