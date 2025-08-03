class OrderProductEntity {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductEntity({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  // todo

  toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }

  toModel() {}
}
