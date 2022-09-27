import 'package:flutter/material.dart';
import 'package:hello_flutter_world/hello_home_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Hello Flutter World',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Poppins',
    ),
    home: const HelloHomePage(),
  )
      // Container(
      //   color: Colors.white,
      //   child: Column(
      //     children: [
      //       Text(
      //         'Hello',
      //         style: TextStyle(color: Colors.black, fontSize: 40),
      //         textDirection: TextDirection.ltr,
      //       ),
      //       Text(
      //         'World',
      //         style: TextStyle(
      //           color: Colors.blue,
      //           fontWeight: FontWeight.bold,
      //           fontSize: 60.0,
      //         ),
      //         textDirection: TextDirection.ltr,
      //       )
      //     ],
      //     mainAxisAlignment: MainAxisAlignment.center,
      //   ),
      // )
      // );
      );
}
