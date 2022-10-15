import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/cart.dart';
import '../../models/product.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> items = [
      Product(id: '1', name: 'Item1', price: 10000, image: 'assets/shoe1.png'),
      Product(id: '2', name: 'Item2', price: 10000, image: 'assets/shoe2.png'),
      Product(id: '3', name: 'Item3', price: 10000, image: 'assets/shoe3.png'),
      Product(id: '4', name: 'Item4', price: 10000, image: 'assets/shoe1.png'),
      Product(id: '5', name: 'Item5', price: 10000, image: 'assets/shoe2.png'),
      Product(id: '6', name: 'Item6', price: 10000, image: 'assets/shoe3.png'),
      Product(id: '7', name: 'Item7', price: 10000, image: 'assets/shoe1.png'),
      Product(id: '8', name: 'Item8', price: 10000, image: 'assets/shoe2.png'),
      Product(id: '9', name: 'Item9', price: 10000, image: 'assets/shoe3.png'),
      Product(
          id: '10', name: 'Item10', price: 10000, image: 'assets/shoe1.png'),
    ];
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Back',
          ),
          title: const Text('Shopping Cart')),
      body: Consumer<Cart>(
        builder: (BuildContext context, Cart cart, Widget? child) {
          return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: cart.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          cart.items[index].product.name,
                        ),
                        leading: Image.network(
                          cart.items[index].product.image,
                          height: 56,
                          width: 56,
                          fit: BoxFit.cover,
                        ),
                        subtitle: Text(
                          'Rp${cart.items[index].product.price}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ShoppingCartItemQty(index: index)
                    ],
                  ),
                );
              });
        },
      ),
      bottomNavigationBar: const ShoppingCartTotal(),
    );
  }
}

class ShoppingCartItemQty extends StatelessWidget {
  const ShoppingCartItemQty({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              Provider.of<Cart>(context, listen: false).removeFromCart(index);
            },
            icon: const Icon(Icons.delete)),
        IconButton(
            onPressed: () {
              // setState(() {
              //   if (_qty > 1) _qty--;
              // });
              Provider.of<Cart>(context, listen: false).decItemQty(index);
            },
            icon: const Icon(Icons.remove)),
        Selector<Cart, int>(
          selector: (BuildContext context, Cart cart) {
            return cart.items[index].qty;
          },
          builder: (BuildContext context, int qty, Widget? child) {
            return Text('$qty');
          },
        ),
        IconButton(
            onPressed: () {
              // setState(() {
              //   _qty++;
              // });
              Provider.of<Cart>(context, listen: false).incItemQty(index);
            },
            icon: const Icon(Icons.add)),
      ],
    );
  }
}

class ShoppingCartTotal extends StatelessWidget {
  const ShoppingCartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.tealAccent.shade400))),
      child: Consumer<Cart>(
        builder: (BuildContext context, Cart cart, Widget? child) {
          return ListTile(
            title: const Text(
              'Total Price',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            subtitle: Text(
              'Rp${cart.totalPrice}',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            trailing: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 150),
              child: TextButton(
                  onPressed: cart.items.isNotEmpty
                      ? () {
                          Navigator.pushNamed(context, '/checkout');
                        }
                      : null,
                  child: const Text('Checkout'),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: cart.items.isNotEmpty
                          ? Colors.tealAccent.shade700
                          : Colors.grey.shade400)),
            ),
          );
        },
      ),
    );
  }
}
