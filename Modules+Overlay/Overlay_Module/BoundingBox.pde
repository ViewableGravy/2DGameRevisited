public class BoundingBox implements Module {
  public int x, y, wid, hei;
  
  public BoundingBox(int x, int y, int wid, int hei) {
    this.x = x;
    this.y = y;
    this.hei = hei;
    this.wid = wid;
  }
  
  public String GetName() { return "BoundingBox"; }
  
  public void Display() {
    rect(x,y,wid,hei);
  }
  
  public boolean Collide(BoundingBox other) {
    return this.x + this.wid > other.x 
        && this.x < other.x + other.wid
        && this.y + this.hei > other.y
        && this.y < other.y + other.hei;
  }
  
  public boolean Collide(int x, int y) {
    return x > this.x && x < this.x + this.wid && y > this.y && y < this.y + this.hei;
  }
}
