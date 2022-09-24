import 'package:flutter/material.dart';
import 'package:gerak_cuy/widgets/custom_text_form_field.dart';
import '../shared/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Daftar',
                      style: blackTextStyle.copyWith(
                          fontSize: 25, fontWeight: bold)),
                ),
                const SizedBox(height: 20),
                Image.asset('assets/login.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 300),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
