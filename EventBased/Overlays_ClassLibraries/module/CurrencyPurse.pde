class CurrencyPurse implements Module {
  private int copper, billBucks, chrisCoins, gravyGold;
  private final int COPPER_TO_GRAVY = 10000;
  private final int COPPER_TO_CHRIS = 1000;
  private final int COPPER_TO_BILL = 100;
  
  //takes a value in copper and converts it up
  public CurrencyPurse(int inCopper) {
    gravyGold = floor(inCopper / COPPER_TO_GRAVY);
    copper = inCopper % COPPER_TO_GRAVY;
    chrisCoins = floor(copper / COPPER_TO_CHRIS);
    copper %= COPPER_TO_CHRIS;
    billBucks = floor(copper/COPPER_TO_BILL);
    copper %= 100;
  }

  public String GetName() { return "CurrencyPurse"; }

  //adds two currency purses
  public CurrencyPurse Add(CurrencyPurse purse) {
    return new CurrencyPurse(ToCopper(this) + ToCopper(purse));
  }
  
  //subtracts two currency purses (Throws exception if the second is larger than first)
  public CurrencyPurse Sub(CurrencyPurse cp) throws Exception {
    int newCopper = ToCopper(this) - ToCopper(cp);
    if (newCopper >= 0) {
      return new CurrencyPurse(newCopper); 
    } else {
      throw new Exception("Cannot Subtract money");
    }
  }
  
  //converts a currency purse to copper
  public int ToCopper(CurrencyPurse cp) {
    int Copper = 0;
    Copper+=cp.copper;
    Copper+=cp.billBucks*COPPER_TO_BILL;
    Copper+=cp.chrisCoins*COPPER_TO_CHRIS;
    Copper+=cp.gravyGold*COPPER_TO_GRAVY;
    return Copper;
  }
}
