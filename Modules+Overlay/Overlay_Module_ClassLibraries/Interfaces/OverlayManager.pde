
public class OverlayManager {
  private Overlay currentOverlay;
  private WorldObjectFactory factory;
  private OverlayFactory oFactory;
  OverlayManager(Overlay current, WorldObjectFactory factory, OverlayFactory oFactory) {
    currentOverlay = current;
    this.factory = factory;
    this.oFactory = oFactory;
  }

  public void DisplayCurrent() {
      currentOverlay.Display();
  }

  ArrayList<WorldObject> worldObjects = new ArrayList<WorldObject>();
  public ArrayList<WorldObject> InteractCurrent(int x, int y) throws Exception{
    if (currentOverlay == null) { 
      return null;
    }

    OverlayInteraction result = currentOverlay.Interact(x, y);
    //havn't clicked anything
    if (result != null) {
      
      //attempt to create new worldObject
      if (result.Type != null) {
        worldObjects.add(factory.Create(result.Type));
      }
      
      //check if the overlay needs to be changed
      Overlay newOverlay = oFactory.Create(result.overlay, currentOverlay);
      if (newOverlay != currentOverlay && newOverlay != null) {
        println("Changing Overlay from " + currentOverlay.name + " to " + result.overlay);
        currentOverlay = newOverlay;
        println("changed Overlay");
      }

      //the resulting action is exiting the overlay
      if (newOverlay == null) {
        println("Exiting Overlay");
        //copies contents of  //<>//
        ArrayList<WorldObject> tempWO = new ArrayList<WorldObject>();
        for (WorldObject itm : worldObjects) {
          tempWO.add(itm);
        }
        //reset worldObjects
        worldObjects = new ArrayList<WorldObject>();
        currentOverlay = null;
        return tempWO;
      }
    }
    return null;
  }
}
