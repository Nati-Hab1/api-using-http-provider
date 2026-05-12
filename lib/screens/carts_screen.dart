import 'package:flutter/material.dart';
import 'package:api_using_http_provider/models/cart.dart';
import 'package:api_using_http_provider/services/api_service.dart';
import 'dart:math';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  List<Cart> carts = [];

  String message = 'Press a button to make API request';

  bool loading = false;

  Future<void> getAllCarts() async {
    try {
      setState(() {
        loading = true;
        message = "Loading...";
      });

      final result = await ApiService.getCarts();

      setState(() {
        carts = result.take(10).toList();
        message = 'Loaded ${carts.length} carts';
        loading = false;
      });
    } catch (e) {
      setState(() {
        message = "Error: $e";
        loading = false;
      });
    }
  }

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
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 91, 145, 229),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 180,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: getAllCarts,
                      child: const Text(
                        "GET All Carts",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: getSingleCart,
                      child: const Text(
                        "GET Random Cart",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 180,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "CREATE Cart",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 180,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "UPDATE Cart",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 180,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "PATCH Cart",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "DELETE Cart",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
