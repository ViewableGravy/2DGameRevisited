public class OverlayFactory{
  
  OverlayFactory() {
    
  }
  
  public Overlay Create(String name, Overlay current) throws Exception{
    switch(name) {
     case "MerchantInterface": return new MerchantMainOverlay(current.boundingBox); 
     case "current": return current;
     case "Exit": return null;
     default: throw new Exception("Cannot create Overlay of type: " + name);
    }
  }
  
}
