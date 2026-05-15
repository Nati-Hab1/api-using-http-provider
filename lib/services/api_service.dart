import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_using_http_provider/models/cart.dart';

class ApiService {
  static const String baseUrl =
      'https://dummyjson.com/carts';

  static Future<List<Cart>> getCarts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(
        response.body,
      );
      final List<dynamic> jsonData = data['carts'];

      return jsonData
          .map((cart) => Cart.fromJson(cart))
          .toList();
    } else {
      throw Exception('Failed to load carts');
    }
  }

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

  static Future<Cart> createCart(
    List<Map<String, dynamic>> products,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': 1, 'products': products}),
    );

    if (response.statusCode == 201) {
      return Cart.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create cart');
    }
  }

  static Future<Cart> updateCart(
    int id,
    List<Map<String, dynamic>> products,
  ) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'merge': false,
        'products': products,
      }),
    );

    if (response.statusCode == 201 ||
        response.statusCode == 200) {
      return Cart.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update cart');
    }
  }

  static Future<Cart> patchCart(
    int id,
    List<Map<String, dynamic>> products,
  ) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'merge': false,
        'products': products,
      }),
    );

    if (response.statusCode == 201 ||
        response.statusCode == 200) {
      return Cart.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to patch cart');
    }
  }

  static Future<bool> deleteCart(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$id'),
    );
    return response.statusCode == 200;
  }
}
