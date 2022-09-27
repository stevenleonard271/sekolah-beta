import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelloWidget extends StatelessWidget {
  const HelloWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      constraints: const BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/star.svg',
            height: 100,
            width: 100,
          ),
          const Text('Hello',
              style: TextStyle(color: Colors.black, fontSize: 40.0)),
          const Text(
            'World!',
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 60.0),
          )
        ],
      ),
    );
  }
}
