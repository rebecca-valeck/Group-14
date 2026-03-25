 class TextButton extends Button {
  float x = 1;
  float y, w, h, r;
  String label;
  boolean stroke = false;
  boolean checked = false;
  String userInput;

  TextButton(float x, float y, float w, float h, String label, float r) {
    super(x,y,w,h,label,r);
    this.userInput = "";
    println(this.x);
    println(x);
  }

 @Override
  boolean clicked(float mx, float my){
    println(mx);
    println(this.x);
    println(x + w);

    System.out.println(mx > x && mx < x+w);
      if(mx > x && mx < x+w && my > y && my < y+h){
            System.out.println("clicked Text button");
            return true;
      }

      return false;
  }
}

//END CLASS