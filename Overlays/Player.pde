

class Player extends WorldObject {
  
  Player() {
    modules.add(new BoundingBox(0,0,0,0));
    modules.add(new Health(100)); 
    
  }
  
}
