import 'package:flutter/material.dart';
import 'package:latihan_navigation/page_two.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    int number = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Page 1'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Saya dipanggil sebanyak $number'),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageTwo(number: number)));
              },
              child: const Text('Navigation to Page 2'))
        ]),
      ),
    );
  }
}
