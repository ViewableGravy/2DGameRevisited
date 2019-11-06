public abstract class Button {
  BoundingBox boundingBox;
  public Button(BoundingBox box) { 
    boundingBox = box; 
  }
  public boolean Collide(int x, int y) { return boundingBox.Collide(x,y); }
  public abstract OverlayInteraction InteractionResult();
  public void Display() { boundingBox.Display(); }
  
}
