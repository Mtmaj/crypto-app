class Crypto{
  String name;
  String symbol;
  double price;
  double changed24H;
  double supply;
  double market_cap;
  Crypto({
    required this.name,
    required this.symbol,
    required this.price,
    required this.changed24H,
    required this.market_cap,
    required this.supply
  });
  static Crypto fromJson(Map<String,dynamic> data){
    return Crypto(
      name: data['name'], 
      symbol: data['symbol'], 
      price: double.parse(data['priceUsd']), 
      changed24H: double.parse(data['changePercent24Hr']),
      market_cap: double.parse(data['marketCapUsd']), 
      supply: double.parse(data['supply']));
  }
}