class Cart {
  final int? id;
  final int? userId;
  final int totalProducts;
  final int totalQuantity;
  final double total;

  Cart({
    this.id,
    this.userId,
    required this.totalProducts,
    required this.totalQuantity,
    required this.total,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      userId: json['userId'],
      totalProducts: json['totalProducts'],
      totalQuantity: json['totalQuantity'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'totalProducts': totalProducts,
      'totalQuantity': totalQuantity,
      'total': total,
    };
  }
}
