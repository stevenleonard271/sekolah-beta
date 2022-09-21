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
          title: Text('Hello World'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                width: 100,
                height: 100,
                child: Text(
                  'Container biru',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PindahLaya()));
                  },
                  child: Text('tekan saya')),
            ],
          ),
        ),
      ),
    );
  }
}

class PindahLaya extends StatelessWidget {
  const PindahLaya({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(color: Colors.red),
      ),
    );
  }
}
