class Cart {
  late int? id;
  final int? productId;
  final String? productName;
  final double? initialPrice;
  final double? productPrice;
  final int? quantity;
  final String? image;

  Cart({
    this.id,
    this.productId,
    this.productName,
    this.initialPrice,
    this.productPrice,
    this.quantity,
    this.image,
  });

  Cart.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        productId = res['productId'],
        productName = res['productName'],
        initialPrice = res['initialPrice'],
        productPrice = res['productPrice'],
        quantity = res['quantity'],
        image = res['image'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'initialPrice': initialPrice,
      'productPrice': productPrice,
      'quantity': quantity,
      'image': image,
    };
  }
}
