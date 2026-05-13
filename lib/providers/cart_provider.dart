import 'package:flutter/material.dart';
import 'package:api_using_http_provider/models/cart.dart';
import 'package:api_using_http_provider/services/api_service.dart';

class CartProvider extends ChangeNotifier {
  List<Cart> carts = [];
  Cart? cart;

  Future<void> fetchAllCarts() async {
    final result = await ApiService.getCarts();
    carts = result.take(10).toList();
    notifyListeners();
  }

  Future<void> fetchSingleCart({required int id}) async {
    cart = await ApiService.getCart(id);
    notifyListeners();
  }
}
