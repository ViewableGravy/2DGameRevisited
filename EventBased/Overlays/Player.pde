

class Player extends WorldObject {
  Player() {
    modules = new ArrayList<Module>() {{
      add(new BoundingBox(0,0,0,0));
      add(new Health(100)); 
      add(new Inventory());
      add(new CurrencyPurse(GetExternalCurrencyPurse("ViewableGravy")));
    }};
    Name = "Player";
  }
}

private int GetExternalCurrencyPurse(String playerName) {
  Integer billBucks = null;
  JSONArray users = loadJSONObject("https://api.streamelements.com/kappa/v2/points/5c235339072350ec38cd501f/top").getJSONArray("users");
  for(int i = 0; i < users.size(); i++) {
    JSONObject user = users.getJSONObject(i);
    if (user.get("username").equals(playerName.toLowerCase())) {
      billBucks = (int)user.get("points");
    }
  } 
  println("Retrieved: " + billBucks);
  if (billBucks != null)
    return billBucks * 100;
  //this is just a test value if it does not work
  return 1000;
}
