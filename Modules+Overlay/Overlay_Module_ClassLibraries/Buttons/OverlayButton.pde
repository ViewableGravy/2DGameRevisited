public class OverlayButton extends Button {
  String worldObjectType;
  String overlayType;

  OverlayButton(BoundingBox box, String overlayType, String worldObjectType) {
    super(box, "images/TestButtonImage.png");
    this.worldObjectType = worldObjectType;
    this.overlayType = overlayType;
  }
  
  public OverlayInteraction InteractionResult() {
    if (this.worldObjectType != null)
      println("Added " + this.worldObjectType + " to cart!");
    return new OverlayInteraction(overlayType,worldObjectType);
  } 
  
}
