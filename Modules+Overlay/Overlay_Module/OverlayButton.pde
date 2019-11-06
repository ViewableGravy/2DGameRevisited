public class OverlayButton extends Button {
  String worldObjectType;
  String overlayType;
  OverlayButton(BoundingBox box, String worldObjectType, String overlayType) {
    super(box);
    this.worldObjectType = worldObjectType;
    this.overlayType = overlayType;
  }
  
  public OverlayInteraction InteractionResult() {
    return new OverlayInteraction(worldObjectType,overlayType);
  } 
  
}
