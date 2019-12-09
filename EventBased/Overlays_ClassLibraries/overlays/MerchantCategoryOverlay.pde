public class MerchantCategoryOverlay extends Overlay {
  ArrayList<Button> buttons;
  World world;
  ArrayList<WorldObject> shoppingCart = new ArrayList<WorldObject>();

  MerchantCategoryOverlay(int x, int y, int wid, int hei, World world) {
    super(new BoundingBox(x,y,wid,hei), "images/OverlayMerchantImage.png");
    buttons = CreateSpecificButtons();
    name = "MerchantCategoryOverlay";
    this.world = world;
  }
  
  MerchantCategoryOverlay(BoundingBox box, World world) {
    super(box, "images/OverlayMerchantImage.png");
    buttons = CreateSpecificButtons();
    name = "MerchantCategoryOverlay";
    this.world = world;
  }
  
  private ArrayList<Button> CreateSpecificButtons() {
    return new ArrayList<Button>() {{
      //Armour Category
      add(new OverlayButton(new BoundingBox(boundingBox.x + Engine.Math.GetPercent(boundingBox.wid,10),
                                            boundingBox.y + Engine.Math.GetPercent(boundingBox.hei,10),
                                            Engine.Math.GetPercent(boundingBox.wid,80),
                                            Engine.Math.GetPercent(boundingBox.hei,20)), 
                            "MerchantPurchaseArmourOverlay",
                            null));
      //Exit (exit interface entirely)
      add(new OverlayButton(new BoundingBox(boundingBox.x + Engine.Math.GetPercent(boundingBox.wid,10),
                                            boundingBox.y + Engine.Math.GetPercent(boundingBox.hei,35),
                                            Engine.Math.GetPercent(boundingBox.wid,80),
                                            Engine.Math.GetPercent(boundingBox.hei,20)),
                            "Exit",
                            null));
    }};
    //close + return object = new OverlayInteraction("exit","WorldObject");
    //close overlay = new OverlayInteraction("exit", null);
    //change context = new OverlayInteraction("Overlay name",null);
    
    
  }

  public void Add(ArrayList<WorldObject> items) {
    for(WorldObject item : items) {
      shoppingCart.add(item);
    }
    println("Shopping cart includes: ");
    for(WorldObject item : items) {
      println(item.Name);
    }
  }
  
  public void Interact() {
    for(Button button : buttons) {
      if (button.Collide()) {
        OverlayInteraction result = button.InteractionResult(); 

        //add new Overlay
        try {
          Overlay newOverlay = world.oFactory.Create(result.overlay, this);
        
          if(newOverlay != null) {
            switch (newOverlay.name) {
              case "MerchantPurchaseArmourOverlay":
                ((MerchantPurchaseArmourOverlay)newOverlay).Add(shoppingCart);
                break;
            }
            world.overlayManager.Add(newOverlay);
          } else { 
            //exit overlay (added items from shopping cart to inventory)
            ((Inventory)world.player.GetModule("Inventory")).Add(shoppingCart);
          }
        } catch (Exception e) {
          println(e);
        }

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
