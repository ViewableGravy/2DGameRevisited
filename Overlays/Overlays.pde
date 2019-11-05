
void setup() {
  Player tempPlayer = new Player();
  BoundingBox temp = (BoundingBox)tempPlayer.GetModule("BoundingBox");
  println(temp.x);
}
