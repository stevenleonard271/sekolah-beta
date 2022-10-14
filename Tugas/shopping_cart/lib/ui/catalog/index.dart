import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/ui/product-detail/index.dart';
import 'package:shopping_cart/ui/shopping_cart/index.dart';
import '../../models/cart.dart';
import '../../models/product.dart';

class CatalogPage extends StatelessWidget {
  CatalogPage({super.key});
  final List<Product> products = [
    Product(
        id: '1',
        name: 'Shoe 1',
        price: 129000,
        description: 'This is a shoe',
        image: 'assets/shoe1.png'),
    Product(
        id: '2',
        name: 'Shoe 2',
        price: 129000,
        description: 'This is another shoe',
        image: 'assets/shoe2.png'),
    Product(
        id: '3',
        name: 'Shoe 3',
        price: 129000,
        description: 'This is also a shoe',
        image: 'assets/shoe3.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          tooltip: 'Menu',
          icon: const Icon(Icons.menu),
        ),
        title: const Text('Catalog'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/shopping_cart');
            },
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Shopping Cart',
          )
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) =>
            CatalogProductCard(product: products[index]),
      ),
    );
  }
}

class CatalogProductCard extends StatelessWidget {
  const CatalogProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/product_detail', arguments: product);
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              product.image,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Rp${product.price}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_outline)),
                      ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 200),
                        child: TextButton.icon(
                            onPressed: () {
                              Provider.of<Cart>(context, listen: false)
                                  .addToCart(product);
                              Navigator.pushNamed(context, '/shopping_cart');
                            },
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.tealAccent.shade700),
                            icon: const Icon(Icons.shopping_cart_outlined),
                            label: const Text('Add to Cart')),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
