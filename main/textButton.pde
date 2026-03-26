 class TextButton extends Button {

  String userInput;

  TextButton(float x, float y, float w, float h, String label, float r) {
    super(x,y,w,h,label,r);
    this.userInput = "";

  }


  boolean clicked(float mx, float my){
      if(mx > x && mx < x+w && my > y && my < y+h){
            if (userInput == "" && mousePressed) label = "| ";
            return true;
      }
      return false;
  }
}

//END CLASS