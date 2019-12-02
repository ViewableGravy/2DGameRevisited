public class OverlayFactory{
  
  OverlayFactory() {
    
  }
  
  public Overlay Create(String name, Overlay current) throws Exception{
    switch(name) {
     case "MerchantCategoryOverlay": return new MerchantCategoryOverlay(current.boundingBox); 
     case "current": return current;
     case "MerchantPurchaseArmourOverlay": return new MerchantPurchaseArmourOverlay(current.boundingBox);
     case "Exit": return null;
     default: throw new Exception("Cannot create Overlay of type: " + name);
    }
  }
  
}
