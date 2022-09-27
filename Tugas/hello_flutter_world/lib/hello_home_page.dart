import 'package:flutter/material.dart';
import 'package:hello_flutter_world/hello_widget.dart';

class HelloHomePage extends StatelessWidget {
  const HelloHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation',
          onPressed: null,
        ),
        title: const Text('Hello Flutter World'),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: Stack(children: [
        Image.asset(
          'assets/background.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        const HelloWidget(),
      ]),
    );
  }
}
