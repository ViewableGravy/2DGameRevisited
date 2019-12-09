
class WorldObject {
  protected ArrayList<Module> modules;
  public String Name;

  WorldObject() {
    Name = "GenericWorldObject";
  }

  public Module GetModule(String moduleName) {
    for(Module mod : modules) {
      if (moduleName == mod.GetName()) {
        return mod; 
      }
    }
    return null;
  }

  public boolean HasModule(String moduleName) {
    for(Module mod : modules) {
      if(moduleName.toLowerCase() == mod.GetName().toLowerCase()) {
        return true; 
      }
    }
    return false;
  }

  public void TroubleShootPrintModules() {
    for(Module mod : modules) {
      println(mod.GetName()); 
    }
  }
  
}
