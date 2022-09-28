import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelloWidget extends StatefulWidget {
  const HelloWidget({super.key});

  //State merupakan tipe kembalian data
  @override
  State<HelloWidget> createState() {
    return _HelloWidgetState();
  }
}

class _HelloWidgetState extends State<HelloWidget> {
  Color _worldColor = Colors.blue.shade700;
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
          Text(
            'World!',
            style: TextStyle(
                color: _worldColor,
                fontWeight: FontWeight.bold,
                fontSize: 60.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: Colors.blue.shade700),
                  onPressed: () {
                    setState(() {
                      _worldColor = Colors.blue.shade700;
                    });
                  },
                  child: null),
              //Tombol warna hijau
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: Colors.green.shade700),
                  onPressed: () {
                    setState(() {
                      _worldColor = Colors.green.shade700;
                    });
                  },
                  child: null),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red.shade700),
                  onPressed: () {
                    setState(() {
                      _worldColor = Colors.red.shade700;
                    });
                  },
                  child: null),
            ],
          )
        ],
      ),
    );
  }
}
