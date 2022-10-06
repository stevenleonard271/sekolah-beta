import 'package:flutter/material.dart';
import 'package:shopping_cart/models/product.dart';
import 'package:shopping_cart/ui/catalog/index.dart';
import 'package:shopping_cart/ui/product-detail/index.dart';
import 'package:shopping_cart/ui/shopping_cart/index.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = Product(
        id: "2",
        name: "Shoe",
        description: "This is a shoe",
        price: 129000,
        image: 'assets/shoe2.png');
    return MaterialApp(
      title: 'InThe Store',
      theme: ThemeData(primarySwatch: Colors.teal),
      routes: {
        '/': (context) => CatalogPage(),
        '/shopping_cart': (context) => const ShoppingCartPage(),
        '/product_detail': (context) => ProductDetailPage(
            product: ModalRoute.of(context)?.settings.arguments as Product),
      },
      // home: CatalogPage(),
    );
  }
}

void main() {
  runApp(const StoreApp());
}
