

class Player extends WorldObject {
  Player() {
    modules = new ArrayList<Module>() {{
      add(new BoundingBox(0,0,0,0));
      add(new Health(100)); 
    }};
    Name = "Player";
  }
}
