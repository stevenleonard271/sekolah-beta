import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/models/cart.dart';
import 'package:shopping_cart/models/product.dart';
import 'package:shopping_cart/ui/catalog/index.dart';
import 'package:shopping_cart/ui/checkout/index.dart';
import 'package:shopping_cart/ui/checkout/process_checkout.dart';
import 'package:shopping_cart/ui/product-detail/index.dart';
import 'package:shopping_cart/ui/shopping_cart/index.dart';
import 'package:firebase_core/firebase_core.dart';

import 'models/order.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InThe Store',
      theme: ThemeData(primarySwatch: Colors.teal),
      routes: {
        '/': (context) => CatalogPage(),
        '/shopping_cart': (context) => const ShoppingCartPage(),
        '/product_detail': (context) => ProductDetailPage(
            product: ModalRoute.of(context)?.settings.arguments as Product),
        '/checkout': (context) => const CheckOut(),
        '/process_checkout': (context) => ProcessCheckOutPage(
            order: ModalRoute.of(context)?.settings.arguments as Order)
      },
      // home: CatalogPage(),
    );
  }
}

Future<List<Product>> getProductsFromFirebase() async {
  return FirebaseFirestore.instance
      .collection('products')
      .get()
      .then((QuerySnapshot q) => List<Product>.generate(q.docs.length, (index) {
            DocumentSnapshot doc = q.docs[index];
            return Product(
                id: doc.id,
                name: doc['name'] as String,
                description: doc['description'] as String,
                price: doc['price'] as int,
                image: doc['image'] as String);
          }));
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBaJZir9Wo4Bk_zwhxqx8Y0l4JZDaVNaWs",
          authDomain: "inthe-store-4da40.firebaseapp.com",
          projectId: "inthe-store-4da40",
          storageBucket: "inthe-store-4da40.appspot.com",
          messagingSenderId: "1034386896687",
          appId: "1:1034386896687:web:7d0ad098c8cd6e836493da",
          measurementId: "G-HHKM9T4TDG"));
  runApp(ChangeNotifierProvider(
      create: (context) => Cart(), child: const StoreApp()));
}
