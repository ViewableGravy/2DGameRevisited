public class TestListener implements Listener {
  int x = 50;
  int y = 50;
  int hei = 50;
  int wid = 50;
  TestListener() {
    
  }
  
  public EventType GetEventType() {
    return EventType.MousePressed; 
  }
  
  public void Run() {
    println("Run");
  }
  
  
}
