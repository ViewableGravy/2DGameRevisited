public class MerchantPurchaseArmourOverlay extends Overlay {
  ArrayList<Button> buttons;
  World world;
  ArrayList<WorldObject> shoppingCart = new ArrayList<WorldObject>();

  MerchantPurchaseArmourOverlay(int x, int y, int wid, int hei, World world) {
    super(new BoundingBox(x,y,wid,hei), "images/OverlayMerchantItemsImage.png");
    name = "MerchantPurchaseArmourOverlay";
    buttons = CreateSpecificButtons();
    this.world = world;
  }

  MerchantPurchaseArmourOverlay(BoundingBox box, World world) {
    super(box, "images/OverlayMerchantItemsImage.png");
    name = "MerchantPurchaseArmourOverlay";
    buttons = CreateSpecificButtons();
    this.world = world;
  }
  
  private ArrayList<Button> CreateSpecificButtons() {
    //println(boundingBox.x + "," + boundingBox.y + "," + boundingBox.wid + "," + boundingBox.hei);
    //println((boundingBox.x + Engine.Math.GetPercent(boundingBox.x,10)) + "," + (boundingBox.y + Engine.Math.GetPercent(boundingBox.y,10)) + "," + Engine.Math.GetPercent(boundingBox.wid,80) + "," + Engine.Math.GetPercent(boundingBox.hei,20));
    return new ArrayList<Button>() {{
      add(new OverlayButton(new BoundingBox(boundingBox.x + Engine.Math.GetPercent(boundingBox.wid,10),
                                            boundingBox.y + Engine.Math.GetPercent(boundingBox.hei,10),
                                            Engine.Math.GetPercent(boundingBox.wid,80),
                                            Engine.Math.GetPercent(boundingBox.hei,20)), 
                            "current",
                            "WorldObject"));
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

  public void Add(ArrayList<WorldObject> shoppingCart) {
    for (WorldObject item : shoppingCart)
      this.shoppingCart.add(item);
  }

  public void Interact() {
    for(Button button : buttons) {
      if (button.Collide()) {
        OverlayInteraction result = button.InteractionResult(); 

        //add new Overlay
        try {
          Overlay newOverlay = world.oFactory.Create(result.overlay, this);

          //attempt to add item to shopping cart
          if (result.Type != null) {
            shoppingCart.add(world.woFactory.Create(result.Type));
          }

          switch (newOverlay.name) {
            case "MerchantCategoryOverlay": 
              ((MerchantCategoryOverlay)newOverlay).Add(shoppingCart);
              break;
          }

          if(newOverlay != null)
            world.overlayManager.Add(newOverlay);
          
        } catch (Exception e) {
          println(e);
        }

        //remove current overlay
        world.overlayManager.Remove(this);
      }
    }
  }

  public void Display() {
    super.Display();
    for(Button button : buttons) {
      button.Display();
    }
  }

}