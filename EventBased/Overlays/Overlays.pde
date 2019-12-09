
World world;

void setup() {
  fullScreen();
  //size(600, 300);
  world = new World();
}

void draw() {
  background(0);
  world.Display();
}

void mousePressed() {
  world.eventManager.ActivateEventListeners(EventType.MousePressed);
}
