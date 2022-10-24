import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gerak_cuy/shared/theme.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Masuk',
                        style: blackTextStyle.copyWith(
                            fontSize: 25, fontWeight: bold)),
                  ),
                  const SizedBox(height: 20),
                  Image.asset('assets/login.png',
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 200),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                      title: 'Email',
                      hintText: 'Masukkan email kamu',
                      prefix: const Icon(Icons.email),
                      margin: const EdgeInsets.only(bottom: 20),
                      controller: emailController),
                  CustomTextFormField(
                      title: 'Password',
                      prefix: const Icon(Icons.key),
                      obscureText: true,
                      hintText: 'Masukkan password kamu',
                      margin: const EdgeInsets.only(bottom: 20),
                      controller: passwordController),
                  const SizedBox(height: 5),
                  CustomButton(
                      title: 'Masuk',
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);
                          Navigator.pushReplacementNamed(
                              context, '/controller');
                        } on FirebaseAuthException catch (e) {
                          showNotification(context, e.message.toString());
                        }
                      }),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum punya akun?',
                        style: blackTextStyle.copyWith(color: Colors.black),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/sign-up');
                          },
                          child: Text(
                            'Daftar',
                            style: blackTextStyle.copyWith(
                                color: Colors.black, fontWeight: bold),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: primaryColor, content: Text(message.toString())));
  }
}
