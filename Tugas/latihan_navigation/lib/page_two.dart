import 'package:flutter/material.dart';
import 'package:latihan_navigation/page_three.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, "dari halaman 2");
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Latihan Page 2'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PageThree()));
                },
                child: const Text('Navigation to Page 3')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'dari halaman 2');
                },
                child: const Text('Back to Page 1'))
          ],
        )),
      ),
    );
  }
}
