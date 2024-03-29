WorldObjectFactory woFactory = new WorldObjectFactory();
OverlayFactory oFactory = new OverlayFactory();
OverlayManager overlayManager = null;

void setup() {
  fullScreen();
  //size(600, 300);
  int left = 100;
  int top = 100;
  overlayManager = new OverlayManager(new MerchantCategoryOverlay(left, top, width-(left*2), height-(top*2)), woFactory, oFactory);
}

void draw() {
  background(0);
  if (overlayManager != null)
    overlayManager.DisplayCurrent();
}

void mousePressed() {
  if (overlayManager == null) {
    println("Warning: overlayManager is null" );
  } else {
    try {
      ArrayList<WorldObject> temp = overlayManager.InteractCurrent((int)mouseX, (int)mouseY);
      if (temp != null) {
        //println("Returned: " + temp);
        println("Returned: ");
        for(WorldObject itm : temp) {
          println("  " + itm.Name);
        }
        overlayManager = null;
        println("Set OverlayManager to null");
      }
    } 
    catch (Exception e) {
      println("Error occured in Overlay_Module between line 19 - 30. Exception was: " + e);
    }
  }
}
