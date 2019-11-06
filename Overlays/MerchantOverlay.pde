public class MerchantMainOverlay extends Overlay {
  ArrayList<Button> buttons;
  int x,y,wid,hei;
  MerchantMainOverlay(int x,int y, int wid, int hei) {
    this.x = x;
    this.y = y;
    this.hei = hei;
    this.wid = wid;
  }
  
  public OverlayInteraction Interact(int x, int y) {
    //test in Overlay area : return worldObject test
    
    /*
    for(Button button : buttons) {
     if (button.Collide(x,y)) {
      return button.InteractionResult(); 
     }
    }
    */
    
    if (x > this.x && x < this.x + this.wid && y > this.y && y < this.y + this.hei) {
      return new OverlayInteraction(this, "WorldObject");
    }
    
    return new OverlayInteraction(null, null);
    
    //close overlay = new OverlayInteraction(null, null);
    //change context = new OverlayInteraction(new OtherOverlay,null);
  }
  
  public void Display() {
    fill(255,0,0);
    rect(x,y,wid,hei);
  }
  
}
