public class OverlayFactory{

  World world;
  
  OverlayFactory(World world) {
    this.world = world;
  }
  
  public Overlay Create(String name, Overlay current) throws Exception{
    switch(name) {
      case "MerchantCategoryOverlay": return new MerchantCategoryOverlay(current.boundingBox, world); 
      case "current": return current;
      case "MerchantPurchaseArmourOverlay": return new MerchantPurchaseArmourOverlay(current.boundingBox,world);
      case "Exit": return null;
      default: throw new Exception("Cannot create Overlay of type: " + name);
    }
  }
  
}
