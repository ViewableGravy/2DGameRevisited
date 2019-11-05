
public class OverlayManager {
  private Overlay currentOverlay;
  private WorldObjectFactory factory;
  OverlayManager(Overlay current, WorldObjectFactory factory) {
    currentOverlay = current;
    this.factory = factory;
  }

  public void DisplayCurrent() {
      currentOverlay.Display();
  }

  ArrayList<WorldObject> worldObjects = new ArrayList<WorldObject>();
  public ArrayList<WorldObject> InteractCurrent(int x, int y) throws Exception {
    if (currentOverlay == null) { 
      return null;
    }

    OverlayInteraction result = currentOverlay.Interact(x, y);
    //havn't clicked anything
    if (result != null) {
      //check if the overlay needs to be changed
      if (result.overlay != null && result.overlay != currentOverlay) {
        println("Changing Overlay from " + currentOverlay + " to " + result.overlay);
        currentOverlay = result.overlay;
        println("changed Overlay");
      }

      if (result.Type != null) {
        worldObjects.add(factory.Create(result.Type));
      }

      //the resulting action is exiting the overlay
      if (result.overlay == null) {
        //copies contents of 
        ArrayList<WorldObject> temp = new ArrayList<WorldObject>();
        for (WorldObject itm : worldObjects) {
          temp.add(itm);
        }
        //reset worldObjects
        worldObjects = new ArrayList<WorldObject>();
        currentOverlay = null;
        return temp;
      }
    }
    return null;
  }
}
