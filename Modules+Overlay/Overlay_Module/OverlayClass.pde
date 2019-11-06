public abstract class Overlay {
  BoundingBox boundingBox;
  public Overlay(BoundingBox outline) { boundingBox = outline; }
  public abstract OverlayInteraction Interact(int x,int y);
  public void Display() {boundingBox.Display(); }
}
