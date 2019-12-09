public class WorldObjectFactory {
  
  WorldObjectFactory() {
    
  }
  
  public WorldObject Create(String name) throws Exception{
    switch (name) {
     case "WorldObject": return new WorldObject(); 
     case "Player": return new Player();
     default: throw new Exception("Cannot create WorldObject of type " + name);
    }
  }
  
}
