import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Halo saya latihan',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.yellow,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Text(
                'Saya Widget di tengah',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              Container(
                width: double.infinity,
                color: Colors.pinkAccent,
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text('Saya kiri', style: TextStyle(fontSize: 30)),
                  Text('Saya kanan', style: TextStyle(fontSize: 30))
                ],
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                color: Colors.yellow,
                height: 75,
                child: Container(
                  color: Colors.purple,
                  child: const Center(
                    child: Text(
                      'Saya berwarna',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: 75,
                width: double.infinity,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    'Saya dibawah sendiri',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.yellow,
          child: const Text(
            'ABC',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
