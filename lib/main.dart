import 'package:api_using_http_provider/providers/cart_provider.dart';
import 'package:api_using_http_provider/providers/loading_provider.dart';
import 'package:api_using_http_provider/providers/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:api_using_http_provider/screens/carts_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoadingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MessageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Ecommerce App',
        home: CartsScreen(),
      ),
    );
  }
}
