public class MerchantPurchaseArmourOverlay extends Overlay {
  ArrayList<Button> buttons;
  MerchantPurchaseArmourOverlay(int x, int y, int wid, int hei) {
    super(new BoundingBox(x,y,wid,hei), "images/OverlayMerchantItemsImage.png");
    name = "MerchantPurchaseArmourOverlay";
    buttons = CreateSpecificButtons();
  }

  MerchantPurchaseArmourOverlay(BoundingBox box) {
    super(box, "images/OverlayMerchantItemsImage.png");
    name = "MerchantPurchaseArmourOverlay";
    buttons = CreateSpecificButtons();
  }
  
  private ArrayList<Button> CreateSpecificButtons() {
    println(boundingBox.x + "," + boundingBox.y + "," + boundingBox.wid + "," + boundingBox.hei);
    println((boundingBox.x + Engine.Math.GetPercent(boundingBox.x,10)) + "," + (boundingBox.y + Engine.Math.GetPercent(boundingBox.y,10)) + "," + Engine.Math.GetPercent(boundingBox.wid,80) + "," + Engine.Math.GetPercent(boundingBox.hei,20));
    return new ArrayList<Button>() {{
      add(new OverlayButton(new BoundingBox(boundingBox.x + Engine.Math.GetPercent(boundingBox.wid,10),
                                            boundingBox.y + Engine.Math.GetPercent(boundingBox.hei,10),
                                            Engine.Math.GetPercent(boundingBox.wid,80),
                                            Engine.Math.GetPercent(boundingBox.hei,20)), 
                            "current",
                            "Player"));
      add(new OverlayButton(new BoundingBox(boundingBox.x + Engine.Math.GetPercent(boundingBox.wid,10),
                                            boundingBox.y + Engine.Math.GetPercent(boundingBox.hei,35),
                                            Engine.Math.GetPercent(boundingBox.wid,80),
                                            Engine.Math.GetPercent(boundingBox.hei,20)),
                            "MerchantCategoryOverlay",
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