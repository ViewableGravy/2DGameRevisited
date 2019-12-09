public class Inventory implements Module {

  private ArrayList<WorldObject> worldObjects;
  Inventory(ArrayList<WorldObject> initialWorldObjects) {
    this.worldObjects = initialWorldObjects;
  };

  Inventory() {
    this.worldObjects = new ArrayList<WorldObject>();
  }
  public String GetName() { return "Inventory"; }
  public void Add(WorldObject item) {
    worldObjects.add(item);
    println("Added " + item + " to " + this);
  }
  public void Add(ArrayList<WorldObject> items) {
    for(WorldObject item : items) {
      worldObjects.add(item);
      println("Added " + item + " to " + this);
    }
  }
  private void Remove(ArrayList<WorldObject> items) {
    worldObjects.remove(items);
  }
  private void Remove(WorldObject item) {
    worldObjects.remove(item);
  }
  public void PrintInventory() {
    for(WorldObject item : worldObjects)
      println(item);
  }
}