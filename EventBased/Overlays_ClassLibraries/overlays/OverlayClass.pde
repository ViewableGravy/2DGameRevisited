public abstract class Overlay {
  BoundingBox boundingBox;
  protected PImage image;
  public String name;

  public Overlay(BoundingBox outline, String imageName) { 
    image = Engine.Generate.ImageFittedToBox(outline,loadImage(imageName));
    boundingBox = outline; 
  }

  public abstract void Interact();

  public void Display() { 
    if (image != null)
      image(image, boundingBox.x, boundingBox.y);
  }
}