public abstract class Button {
  BoundingBox boundingBox;
  PImage image;
  public Button(BoundingBox box, String imageName) { 
    boundingBox = box; 
    image = Engine.Generate.ImageFittedToBox(box,loadImage(imageName));
  }
  public boolean Collide() { return boundingBox.Collide(mouseX,mouseY); }
  public abstract OverlayInteraction InteractionResult();
  public void Display() { 
    boundingBox.Display();
    if (image != null)
      image(image, boundingBox.x, boundingBox.y);
  }
  
}

