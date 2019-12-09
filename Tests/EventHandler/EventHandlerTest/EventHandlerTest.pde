EventHandler handler = new EventHandler();

void setup() {
  handler.SubscribeListener(new TestListener());
  handler.UnSubscribeListeners(EventType.MousePressed);
  
  
}


void draw() {
  
}
