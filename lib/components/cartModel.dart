class Cart {
  late final int? id;
  final String? productId;
  final String? nama_menu;
  final int? initialPrice;
  final int? harga_menu;
  final int? quantity;

  Cart({
    required this.id,
    required this.productId,
    // ignore: non_constant_identifier_names
    required this.nama_menu,
    required this.initialPrice,
    // ignore: non_constant_identifier_names
    required this.harga_menu,
    required this.quantity,
  });

  Cart.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        productId = res["productId"],
        nama_menu = res["nama_menu"],
        initialPrice = res["initialPrice"],
        harga_menu = res["harga_menu"],
        quantity = res["quantity"];
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'productId': productId,
      'nama_menu': nama_menu,
      'initialPrice': initialPrice,
      'harga_menu': harga_menu,
      'quantity': quantity,
    };
  }

  then(Null Function(dynamic value) param0) {}
}