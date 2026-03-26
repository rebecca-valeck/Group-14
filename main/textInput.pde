ArrayList<String> alpha = new ArrayList<String>(Arrays.asList(" ", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "{", "|", "}"));
ArrayList<String> beta = new ArrayList<String>(Arrays.asList(" ", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", "/"));

void keyPressed() {
  String newLetter = str(key);
  Button clickedButton = theScreen.getEvent();


  System.out.println(clickedButton instanceof Button);
  if (clickedButton != null && clickedButton instanceof TextButton){
    TextButton clickedTextButton = (TextButton) clickedButton;
    if (alpha.contains(newLetter)){
      if (clickedButton.label == "| "  || clickedButton.label == "" ) {
        clickedTextButton.userInput += newLetter;
        clickedButton.label = clickedTextButton.userInput;
      }
      else if (clickedButton.label == clickedTextButton.userInput) {
        clickedTextButton.userInput += newLetter;
        clickedButton.label = clickedTextButton.userInput;

      }
    }
    if (key == BACKSPACE && clickedButton.label.length() > 0){
      clickedTextButton.userInput = clickedTextButton.userInput.substring(0,clickedTextButton.userInput.length()-1);
      clickedButton.label = clickedTextButton.userInput;
    } 
      if (key == ENTER ||  key == RETURN){
    //    theScreen = screens.get(3);
     //   screens.get(3).addBarchart(new Barchart(SCREENX/2, SCREENY/2, 800, 600, 60, origins));
    } 
  }

}