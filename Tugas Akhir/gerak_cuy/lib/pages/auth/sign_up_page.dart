import 'package:flutter/material.dart';
import 'package:gerak_cuy/widgets/custom_button.dart';
import 'package:gerak_cuy/widgets/custom_text_form_field.dart';
import '../../shared/theme.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Daftar',
                        style: blackTextStyle.copyWith(
                            fontSize: 25, fontWeight: bold)),
                  ),
                  const SizedBox(height: 20),
                  Image.asset('assets/register.png',
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 200),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                      title: 'Nama lengkap',
                      prefix: const Icon(Icons.person),
                      hintText: 'Masukkan nama lengkap kamu',
                      margin: const EdgeInsets.only(bottom: 20),
                      controller: nameController),
                  CustomTextFormField(
                      title: 'Email',
                      prefix: const Icon(Icons.email),
                      hintText: 'Masukkan email kamu',
                      margin: const EdgeInsets.only(bottom: 20),
                      controller: emailController),
                  CustomTextFormField(
                      title: 'Password',
                      obscureText: true,
                      prefix: const Icon(Icons.key),
                      hintText: 'Masukkan password kamu',
                      margin: const EdgeInsets.only(bottom: 20),
                      controller: passwordController),
                  const SizedBox(height: 5),
                  CustomButton(title: 'Daftar', onPressed: () {}),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun?',
                        style: blackTextStyle.copyWith(color: Colors.black),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/sign-in');
                          },
                          child: Text(
                            'Masuk',
                            style: blackTextStyle.copyWith(
                                color: Colors.black, fontWeight: bold),
                          ))
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
}
