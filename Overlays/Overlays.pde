WorldObjectFactory woFactory = new WorldObjectFactory();

OverlayManager overlayManager = new OverlayManager(new MerchantOverlay(100, 100, 100, 100), woFactory);

void setup() {
  size(300, 300);
}

void draw() {
  background(0);
  if (overlayManager != null)
    overlayManager.DisplayCurrent();
}

void mousePressed() {
  try {
    ArrayList<WorldObject> temp = overlayManager.InteractCurrent((int)mouseX, (int)mouseY);
    if (temp != null) {
      println(temp);
      overlayManager = null;
    }
  } 
  catch (Exception e) {
    println(e);
  }
}
