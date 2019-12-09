public class EventHandler {
 
  HashMap<EventType,ArrayList<Listener>> listeners = new HashMap<EventType,ArrayList<Listener>>() {{ 
    put(EventType.MousePressed,new ArrayList<Listener>());
    put(EventType.MouseMoved,new ArrayList<Listener>());
  }};
  
  EventHandler() {
    
  }
  
  public void SubscribeListener(Listener listener) {
    listeners.get(listener.GetEventType()).add(listener);
  }
  
  public void UnSubscribeListener(Listener listener) {
    listeners.get(listener.GetEventType()).remove(listener);
  }
  
  public void UnSubscribeListeners(EventType type) {
    (listeners.get(type)).clear();
  }
  
  public void ActivateEventListeners(EventType type) {
    for(Listener listener : listeners.get(type)) {
      listener.Run();
    }
  }
}
