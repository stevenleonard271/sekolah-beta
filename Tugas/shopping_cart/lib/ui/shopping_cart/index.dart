import 'package:flutter/material.dart';
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
    // final List<String> items = [
    //   'Item 1',
    //   'Item 2',
    //   'Item 3',
    //   'Item 4',
    //   'Item 5',
    //   'Item 6',
    //   'Item 7',
    //   'Item 8',
    //   'Item 9',
    //   'Item 10'
    // ];
    // final List<int> prices = [
    //   10000,
    //   20000,
    //   30000,
    //   40000,
    //   50000,
    //   60000,
    //   70000,
    //   80000,
    //   90000,
    //   100000,
    // ];
    // final List<String> pictures = [
    //   'assets/shoe1.png',
    //   'assets/shoe2.png',
    //   'assets/shoe3.png',
    //   'assets/shoe1.png',
    //   'assets/shoe2.png',
    //   'assets/shoe3.png',
    //   'assets/shoe1.png',
    //   'assets/shoe2.png',
    //   'assets/shoe3.png',
    //   'assets/shoe1.png',
    // ];
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
              tooltip: 'Back',
            ),
            title: const Text('Shopping Cart')),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(items[index].name),
                      leading: Image.asset(
                        items[index].image,
                        height: 56,
                        width: 56,
                        fit: BoxFit.cover,
                      ),
                      subtitle: Text(
                        'Rp${items[index].price}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {},
                      ),
                    ),
                    const ShoppingCartItemQty()
                  ],
                ),
              );
            }));
  }
}

class ShoppingCartItemQty extends StatefulWidget {
  const ShoppingCartItemQty({super.key});

  @override
  State<ShoppingCartItemQty> createState() => _ShoppingCartItemQtyState();
}

class _ShoppingCartItemQtyState extends State<ShoppingCartItemQty> {
  int _qty = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
        IconButton(
            onPressed: () {
              setState(() {
                if (_qty > 1) _qty--;
              });
            },
            icon: const Icon(Icons.remove)),
        Text('$_qty'),
        IconButton(
            onPressed: () {
              setState(() {
                _qty++;
              });
            },
            icon: const Icon(Icons.add))
      ],
    );
  }
}
