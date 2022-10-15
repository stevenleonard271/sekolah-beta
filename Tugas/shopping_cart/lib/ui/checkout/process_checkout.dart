import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/models/order.dart';

import '../../models/cart.dart';

class ProcessCheckOutPage extends StatelessWidget {
  const ProcessCheckOutPage({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: sendOrderToFirebase(order),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'An Error has occured:\n${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }
          if (snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Order Placed!',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Provider.of<Cart>(context, listen: false).clearCart();
                  },
                  child: const Text('Finish'),
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Colors.tealAccent.shade700),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
