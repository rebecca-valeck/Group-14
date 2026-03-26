 class TextButton extends Button {

  String userInput;

  TextButton(float x, float y, float w, float h, String label, float r) {
    super(x,y,w,h,label,r);
    this.userInput = "";

  }


  boolean clicked(float mx, float my){
   
    System.out.println(mx > x && mx < x+w);
      if(mx > x && mx < x+w && my > y && my < y+h){
            System.out.println("clicked Text button");
            return true;
      }
      return false;
  }
}

//END CLASS