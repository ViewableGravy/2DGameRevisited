public class Overlay {
  public Overlay() {
      
  }
  
  //@test
  public OverlayInteraction Interact(int x, int y) {
    if (x == 0 && y == 10) {
     println("Interact y=10");
     
     return new OverlayInteraction(this,"Successful"); 
    } else if (x == 10 && y == 0) {
      println("Interact x=10");
    return new OverlayInteraction(new Overlay(),null);
    }
    println("Interact failed");
    return null;
  }
  
  public void Display() {
    
  }
}
