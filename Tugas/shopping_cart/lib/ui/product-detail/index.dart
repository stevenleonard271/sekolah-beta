import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/models/product.dart';
import 'package:shopping_cart/ui/shopping_cart/index.dart';

import '../../models/cart.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Product Details'),
      ),
      body: ListView(
        children: [
          Image.asset(
            product.image,
            height: 300,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(
              'Rp${product.price}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              product.name,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            trailing: IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
          ),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            title: const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              product.description,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: TextButton.icon(
            onPressed: () {
              Provider.of<Cart>(context, listen: false).addToCart(product);
              Navigator.pushNamed(context, '/shopping_cart');
            },
            icon: const Icon(Icons.shopping_cart_outlined),
            label: const Text('Add to Cart'),
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.tealAccent.shade700),
          ),
        ),
      ],
    );
  }
}
