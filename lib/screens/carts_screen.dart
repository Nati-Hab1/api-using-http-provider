import 'package:api_using_http_provider/providers/loading_provider.dart';
import 'package:api_using_http_provider/providers/message_provider.dart';
import 'package:api_using_http_provider/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  Future<void> getAllCarts() async {
    try {
      context.read<LoadingProvider>().changeLoading(
        value: true,
      );
      context.read<MessageProvider>().changeMessage(
        newMessage: "Loading...",
      );

      await context.read<CartProvider>().fetchAllCarts();
      context.read<LoadingProvider>().changeLoading(
        value: false,
      );

      final count = context
          .read<CartProvider>()
          .carts
          .length;
      context.read<MessageProvider>().changeMessage(
        newMessage: "Loaded ${count} carts",
      );
    } catch (e) {
      context.read<LoadingProvider>().changeLoading(
        value: false,
      );
      context.read<MessageProvider>().changeMessage(
        newMessage: "Error: $e",
      );
    }
  }

  Future<void> getSingleCart() async {
    try {
      context.read<LoadingProvider>().changeLoading(
        value: true,
      );
      context.read<MessageProvider>().changeMessage(
        newMessage: "Loading...",
      );

      Random random = Random();
      int id = random.nextInt(30) + 1;

      await context.read<CartProvider>().fetchSingleCart(
        id: id,
      );

      context.read<LoadingProvider>().changeLoading(
        value: false,
      );

      final cart = context.read<CartProvider>().cart;

      context.read<MessageProvider>().changeMessage(
        newMessage:
            "Fetched Cart: ${cart?.id}\nUser Id: ${cart?.userId}\nTotal Products: ${cart?.totalProducts}\nTotal Quantity: ${cart?.totalQuantity}\nTotal: ${cart?.total}",
      );
    } catch (e) {
      context.read<LoadingProvider>().changeLoading(
        value: false,
      );
      context.read<MessageProvider>().changeMessage(
        newMessage: "Error: $e",
      );
    }
  }

  Future<void> createCart() async {
    try {
      context.read<LoadingProvider>().changeLoading(
        value: true,
      );
      context.read<MessageProvider>().changeMessage(
        newMessage: "Loading...",
      );
      await context.read<CartProvider>().createNewCart();
      context.read<LoadingProvider>().changeLoading(
        value: false,
      );
      final cart = context.read<CartProvider>().cart;
      context.read<MessageProvider>().changeMessage(
        newMessage:
            "Created Cart: ${cart?.id}\nUser Id: ${cart?.userId}\nTotal Products: ${cart?.totalProducts}\nTotal Quantity: ${cart?.totalQuantity}\nTotal: ${cart?.total}",
      );
    } catch (e) {
      context.read<LoadingProvider>().changeLoading(
        value: false,
      );
      context.read<MessageProvider>().changeMessage(
        newMessage: "Error: $e",
      );
    }
  }

  Future<void> updateCart() async {
    try {
      context.read<LoadingProvider>().changeLoading(
        value: true,
      );
      context.read<MessageProvider>().changeMessage(
        newMessage: "Loading...",
      );
      await context
          .read<CartProvider>()
          .updateExisitingCart();
      context.read<LoadingProvider>().changeLoading(
        value: false,
      );
      final cart = context.read<CartProvider>().cart;
      context.read<MessageProvider>().changeMessage(
        newMessage:
            "Updated Cart: ${cart?.id}\nUser Id: ${cart?.userId}\nTotal Products: ${cart?.totalProducts}\nTotal Quantity: ${cart?.totalQuantity}\nTotal: ${cart?.total}",
      );
    } catch (e) {
      context.read<LoadingProvider>().changeLoading(
        value: false,
      );
      context.read<MessageProvider>().changeMessage(
        newMessage: "Error: $e",
      );
    }
  }

  Future<void> patchCart() async {
    try {
      context.read<LoadingProvider>().changeLoading(
        value: true,
      );
      context.read<MessageProvider>().changeMessage(
        newMessage: "Loading...",
      );
      await context
          .read<CartProvider>()
          .patchExisitingCart();
      context.read<LoadingProvider>().changeLoading(
        value: false,
      );
      final cart = context.read<CartProvider>().cart;
      context.read<MessageProvider>().changeMessage(
        newMessage:
            "Patched Cart: ${cart?.id}\nUser Id: ${cart?.userId}\nTotal Products: ${cart?.totalProducts}\nTotal Quantity: ${cart?.totalQuantity}\nTotal: ${cart?.total}",
      );
    } catch (e) {
      context.read<LoadingProvider>().changeLoading(
        value: false,
      );
      context.read<MessageProvider>().changeMessage(
        newMessage: "Error: $e",
      );
    }
  }

  Future<void> deleteCart() async {
    try {
      context.read<LoadingProvider>().changeLoading(
        value: true,
      );
      context.read<MessageProvider>().changeMessage(
        newMessage: "Deleting Cart...",
      );
      await context
          .read<CartProvider>()
          .deleteExisitingCart();
      context.read<LoadingProvider>().changeLoading(
        value: false,
      );
      final isDeleted = context
          .read<CartProvider>()
          .isDeleted;
      context.read<MessageProvider>().changeMessage(
        newMessage: isDeleted
            ? "Deleted cart successfully"
            : "Cart deletion failed",
      );
    } catch (e) {
      context.read<LoadingProvider>().changeLoading(
        value: false,
      );
      context.read<MessageProvider>().changeMessage(
        newMessage: "Error: $e",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Carts Page Using HTTP and Provider",
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 91, 145, 229),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.watch<MessageProvider>().message,
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
                      onPressed: createCart,
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
                      onPressed: updateCart,
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
                      onPressed: patchCart,
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
                      onPressed: deleteCart,
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
