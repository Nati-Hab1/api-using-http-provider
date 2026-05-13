import 'package:flutter/material.dart';
import 'package:api_using_http_provider/models/cart.dart';
import 'package:api_using_http_provider/services/api_service.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> carts = [];
  Cart? cart;
  bool isDeleted = false;

  Future<void> fetchAllCarts() async {
    final result = await ApiService.getCarts();
    carts = result.toList();
    notifyListeners();
  }

  Future<void> fetchSingleCart({required int id}) async {
    cart = await ApiService.getCart(id);
    notifyListeners();
  }

  Future<void> createNewCart() async {
    cart = await ApiService.createCart([
      {"id": 144, "quantity": 4},
      {"id": 98, "quantity": 1},
    ]);
    notifyListeners();
  }

  Future<void> updateExisitingCart() async {
    cart = await ApiService.updateCart(2, [
      {
        "id": 1,
        "title": "Esence Mascara Lash Princess",
        "price": 9.99,
        "quantity": 1,
        "thumbnail":
            "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp",
      },
    ]);
    notifyListeners();
  }

  Future<void> patchExisitingCart() async {
    cart = await ApiService.patchCart(2, [
      {"id": 1, "quantity": 6},
    ]);
    notifyListeners();
  }

  Future<void> deleteExisitingCart() async {
    isDeleted = await ApiService.deleteCart(1);
    notifyListeners();
  }
}
