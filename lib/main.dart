import 'package:flutter/material.dart';
import 'package:api_using_http_provider/screens/carts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      home: CartsScreen(),
    );
  }
}
