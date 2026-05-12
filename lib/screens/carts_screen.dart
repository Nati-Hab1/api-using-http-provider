import 'package:flutter/material.dart';
import 'package:api_using_http_provider/models/cart.dart';
import 'package:api_using_http_provider/services/api_service.dart';
import 'dart:math';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() =>
      _ProductsScreenState();
}

class _ProductsScreenState extends State<CartsScreen> {
  List<Cart> products = [];

  String message = 'Press a button to make API request';

  bool loading = false;

  Future<void> getSingleCart() async {
    try {
      setState(() {
        loading = true;
        message = "Loading...";
      });

      Random random = Random();
      int id = random.nextInt(30) + 1;

      final cart = await ApiService.getCart(id);

      setState(() {
        message =
            'Fetched Cart: ${cart.id}\nUser Id: ${cart.userId}\nTotal Products: ${cart.totalProducts}\nTotal Quantity: ${cart.totalQuantity}\nTotal: ${cart.total}';
      });
    } catch (e) {
      setState(() {
        message = "Error: $e";
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: getSingleCart,
              child: const Text("Get Random Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
