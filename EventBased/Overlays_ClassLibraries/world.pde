public class World {

  //perm Objects
  EventHandler eventManager;
  WorldObjectFactory woFactory;
  OverlayFactory oFactory;
  OverlayManager overlayManager;
  EventHandler eventHandler;
  Player player;

  //temp Objects


  World() {

  int left = 100;
  int top = 100;


  println("Created World");
  eventManager = new EventHandler();
  println("Created EventManager");
  ArrayList<Overlay> initialOverlays = new ArrayList<Overlay>();
  initialOverlays.add(new MerchantCategoryOverlay(left, top, width-(left*2), height-(top*2), this));
  println("Created Initial Overlays");
  overlayManager = new OverlayManager(initialOverlays, this);
  println("Created OverlayManager");
  woFactory = new WorldObjectFactory();
  println("Created World Object Factory");
  oFactory = new OverlayFactory(this);
  println("Created Overlay Factory");
  player = new Player(); 
  println("Created Player");

  eventManager.SubscribeListener(overlayManager);
    println("Subscribed overlay manager to eventManager");
  }

  public void Display() {
    overlayManager.Display();
  }
}