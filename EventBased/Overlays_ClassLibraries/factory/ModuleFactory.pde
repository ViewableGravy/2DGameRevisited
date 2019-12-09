
public class ModuleFactory {

  public Module GetModule(String WorldObjectType) {
      switch (WorldObjectType) {
        case "BoundingBox":
          return new BoundingBox(0,0,0,0);
        default:
          return null;
      }
  }
  
}
