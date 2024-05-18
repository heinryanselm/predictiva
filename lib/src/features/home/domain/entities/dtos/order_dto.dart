class OrderDto {
  final String symbol;
  final String type;
  final String side;
  final double quantity;
  final int creationTime;
  final double price;

  OrderDto({
    required this.symbol,
    required this.type,
    required this.side,
    required this.quantity,
    required this.creationTime,
    required this.price,
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) {
    return OrderDto(
      symbol: json['symbol'] ?? '',
      type: json['type'] ?? '',
      side: json['side'] ?? '',
      quantity: json['quantity'] ?? 0,
      creationTime: json['creation_time'] ?? 0,
      price: json['price'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'type': type,
      'side': side,
      'quantity': quantity,
      'creation_time': creationTime,
      'price': price,
    };
  }

  OrderDto copyWith({
    String? symbol,
    String? type,
    String? side,
    double? quantity,
    int? creationTime,
    double? price,
  }) {
    return OrderDto(
      symbol: symbol ?? this.symbol,
      type: type ?? this.type,
      side: side ?? this.side,
      quantity: quantity ?? this.quantity,
      creationTime: creationTime ?? this.creationTime,
      price: price ?? this.price,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderDto &&
        other.symbol == symbol &&
        other.type == type &&
        other.side == side &&
        other.quantity == quantity &&
        other.creationTime == creationTime &&
        other.price == price;
  }

  @override
  int get hashCode {
    return symbol.hashCode ^
        type.hashCode ^
        side.hashCode ^
        quantity.hashCode ^
        creationTime.hashCode ^
        price.hashCode;
  }

  @override
  String toString() {
    return 'OrderModel(symbol: $symbol, type: $type, side: $side, quantity: $quantity, creationTime: $creationTime, price: $price)';
  }
}
