import 'package:flutter/material.dart';
import 'package:latihan_navigation/page_one.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Navigasi',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const PageOne(),
    );
  }
}
