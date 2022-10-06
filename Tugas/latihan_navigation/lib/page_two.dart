import 'package:flutter/material.dart';
import 'package:latihan_navigation/page_one.dart';

class PageTwo extends StatelessWidget {
  PageTwo({super.key, required this.number});

  int number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Page 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PageThird()));
              },
              child: const Text('Navigation to Page 3')),
          ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => true);
              },
              child: const Text('Back to Page 1')),
        ]),
      ),
    );
  }
}
