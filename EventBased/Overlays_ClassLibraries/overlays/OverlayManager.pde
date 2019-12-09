
public class OverlayManager implements Listener{
  private ArrayList<Overlay> currentOverlays;
  private World world;
  OverlayManager(ArrayList<Overlay> currentOverlays, World world) {
    this.currentOverlays = currentOverlays;
    this.world = world;
  }

  public EventType GetEventType() {
    return EventType.MousePressed;
  }

  public void Add(Overlay newOverlay) {
    currentOverlays.add(newOverlay);
  }

  public void Remove(Overlay oldOverlay) {
    currentOverlays.remove(oldOverlay);
  }

  public void Display() {
    //no priority
    for(Overlay overlay : currentOverlays) {
      overlay.Display();
    }
  }

  public void Execute() {
    if (currentOverlays.isEmpty()) {
      println("No overlays");
      return;
    }

    int i = currentOverlays.size() - 1;
    while(!currentOverlays.isEmpty() && i >= 0) {
      Overlay temp = currentOverlays.get(i);
      temp.Interact();
      --i;
    }
  }
}
