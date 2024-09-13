class MarketModel {
  final String brand;
  final String trade;
  final String type;
  final String state;
  final String city;
  final String address;
  MarketModel({
    required this.brand,
    required this.trade,
    required this.type,
    required this.state,
    required this.city,
    required this.address,
  });

  factory MarketModel.example() => MarketModel(
        brand: 'brand',
        trade: 'trade',
        type: 'type',
        state: 'state',
        city: 'city',
        address: 'address',
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'brand': brand,
      'trade': trade,
      'type': type,
      'state': state,
      'city': city,
      'address': address,
    };
  }

  factory MarketModel.fromMap(Map<String, dynamic> map) {
    return MarketModel(
      brand: map['brand'] as String,
      trade: map['trade'] as String,
      type: map['type'] as String,
      state: map['state'] as String,
      city: map['city'] as String,
      address: map['address'] as String,
    );
  }

  @override
  String toString() {
    return 'MarketModel(brand: $brand, trade: $trade, type: $type, state: $state, city: $city, address: $address)';
  }
}
