WorldObjectFactory woFactory = new WorldObjectFactory();
OverlayFactory oFactory = new OverlayFactory();

OverlayManager overlayManager = new OverlayManager(new MerchantMainOverlay(100, 100, 100, 100), woFactory, oFactory);

void setup() {
  size(300, 300);
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
        println("Returned: " + temp);
        overlayManager = null;
        println("Set OverlayManager to null");
      }
    } 
    catch (Exception e) {
      println(e);
    }
  }
}
