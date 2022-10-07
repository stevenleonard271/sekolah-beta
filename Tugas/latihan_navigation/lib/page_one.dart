import 'package:flutter/material.dart';

import 'page_two.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  int screenView = 0;
  String page = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Saya dipanggil sebanyak $screenView'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  final data = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const PageTwo()));
                  setState(() {
                    screenView++;
                    if (data != null) {
                      page = data;
                    } else {
                      page = "";
                    }
                  });
                },
                child: const Text('Navigation to Page 2')),
            const SizedBox(height: 20),
            Visibility(
              child: Text('Saya kembali dari $page'),
              visible: page.isNotEmpty,
            )
          ],
        ),
      ),
    );
  }
}
