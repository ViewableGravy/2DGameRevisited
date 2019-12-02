public class MerchantCategoryOverlay extends Overlay {
  ArrayList<Button> buttons;
  MerchantCategoryOverlay(int x,int y, int wid, int hei) {
    super(new BoundingBox(x,y,wid,hei), "images/OverlayMerchantImage.png");
    buttons = CreateSpecificButtons();
    name = "MerchantCategoryOverlay";
  }
  
  MerchantCategoryOverlay(BoundingBox box) {
    super(box, "images/OverlayMerchantImage.png");
    buttons = CreateSpecificButtons();
    name = "MerchantCategoryOverlay";
  }
  
  private ArrayList<Button> CreateSpecificButtons() {
    return new ArrayList<Button>() {{
      //Armour Category
      add(new OverlayButton(new BoundingBox(boundingBox.x + Engine.Math.GetPercent(boundingBox.x,10),
                                            boundingBox.y + Engine.Math.GetPercent(boundingBox.y,10),
                                            Engine.Math.GetPercent(boundingBox.wid,80),
                                            Engine.Math.GetPercent(boundingBox.hei,20)), 
                            "MerchantPurchaseArmourOverlay",
                            null));
      //Exit (exit interface entirely)
      add(new OverlayButton(new BoundingBox(boundingBox.x + Engine.Math.GetPercent(boundingBox.x,10),
                                            boundingBox.y + Engine.Math.GetPercent(boundingBox.y,35),
                                            Engine.Math.GetPercent(boundingBox.wid,80),
                                            Engine.Math.GetPercent(boundingBox.hei,20)),
                            "Exit",
                            null));
    }};
    //close + return object = new OverlayInteraction("exit","WorldObject");
    //close overlay = new OverlayInteraction("exit", null);
    //change context = new OverlayInteraction("Overlay name",null);
    
    
  }
  
  public OverlayInteraction Interact(int x, int y) {
    //test in Overlay area : return worldObject test
    
    
    for(Button button : buttons) {
      if (button.Collide(x,y)) {
        return button.InteractionResult(); 
      }
    }
    return null;
    
    
  }
  
  public void Display() {
    super.Display();
    for(Button button : buttons) {
      button.Display();
    }
  }
  
}
