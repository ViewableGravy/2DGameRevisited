public class MerchantMainOverlay extends Overlay {
  ArrayList<Button> buttons;
  MerchantMainOverlay(int x,int y, int wid, int hei) {
    super(new BoundingBox(x,y,wid,hei));
    buttons = CreateSpecificButtons();
  }
  
  MerchantMainOverlay(BoundingBox box) {
   super(box);
   buttons = CreateSpecificButtons();
  }
  
  private ArrayList<Button> CreateSpecificButtons() {
    return new ArrayList<Button>() {{
       add(new OverlayButton(new BoundingBox(boundingBox.x + Math.GetPercent(boundingBox.x,10),
                                             boundingBox.y + Math.GetPercent(boundingBox.y,10),
                                             Math.GetPercent(boundingBox.wid,80),
                                             Math.GetPercent(boundingBox.hei,20)), 
                             "current",
                             "Player"));
       add(new OverlayButton(new BoundingBox(boundingBox.x + Math.GetPercent(boundingBox.x,10),
                                             boundingBox.y + Math.GetPercent(boundingBox.y,35),
                                             Math.GetPercent(boundingBox.wid,80),
                                             Math.GetPercent(boundingBox.hei,20)),
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
    fill(255,0,0);
    boundingBox.Display();
    fill(0,255,0);
    for(Button button : buttons) {
      button.Display();
    }
  }
  
}
