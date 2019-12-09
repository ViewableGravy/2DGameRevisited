

public static class Engine {

  public static class Generate {
    // not yet implemented
    public static PImage ImageFittedToBox(BoundingBox box, PImage image) {
      image.resize(box.wid,box.hei);

      return image;
    }
  }

  public static class Math {
    public static int GetPercent(int value, int percent) {
      return ceil(value * (percent*0.01));
    } 
  }
}


