import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_using_http_provider/models/cart.dart';

class ApiService {
  static const String baseUrl =
      'https://dummyjson.com/carts';

  static Future<Cart> getCart(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$id'),
    );

    if (response.statusCode == 200) {
      return Cart.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load cart');
    }
  }
}
