class FilterButton extends Button{
    boolean checked = false;

    FilterButton(float x, float y, float w, float h, String label) {
    super(x,y,w,h,label);
  }

  @Override
  boolean clicked(float mx, float my){
      if(mx > x && mx < x+w && my > y && my < y+h){
        if (checked) checked = false;
        else checked = true;
        return true;
      }
      return false;
  }
}