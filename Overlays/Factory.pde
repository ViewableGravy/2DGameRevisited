public class WorldObjectFactory {
  
  WorldObjectFactory() {
    
  }
  
  public WorldObject Create(String name) throws Exception{
   if(name == "WorldObject") {
     //default test object
     return new WorldObject(); 
   } else {
     throw new Exception("Cannot create WorldObject of type " + name);
   }
  }
  
}
