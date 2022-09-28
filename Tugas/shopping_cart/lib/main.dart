import 'package:flutter/material.dart';
import 'package:shopping_cart/ui/shopping_cart/index.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'In The Store',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: const ShoppingCartPage());
  }
}

void main() {
  runApp(const StoreApp());
}
