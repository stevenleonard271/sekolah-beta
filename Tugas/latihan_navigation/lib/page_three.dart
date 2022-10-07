import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Page 3'),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {}, child: const Text('Navigation to Page 4'))),
    );
  }
}
