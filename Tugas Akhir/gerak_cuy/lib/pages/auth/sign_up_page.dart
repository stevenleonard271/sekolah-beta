import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gerak_cuy/models/user_model.dart';
import 'package:gerak_cuy/widgets/custom_button.dart';
import 'package:gerak_cuy/widgets/custom_text_form_field.dart';
import '../../shared/theme.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  final _auth = FirebaseAuth.instance;
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
                  CustomButton(
                      title: 'Daftar',
                      onPressed: () async {
                        try {
                          await _auth
                              .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((value) {
                            postDetailtoFireStore();
                            Navigator.pushNamed(context, '/sign-in');
                          });
                        } on FirebaseAuthException catch (e) {
                          showNotification(context, e.message.toString());
                        }
                      }),
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

  postDetailtoFireStore() async {
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.fullName = nameController.text;
    userModel.foto =
        "https://firebasestorage.googleapis.com/v0/b/gerakcuy-93803.appspot.com/o/170-1708409_headshot-placeholder-silhouette-gender-neutral.png?alt=media&token=9bb4cb71-6095-4c67-99be-56166703955f";

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());
  }
}

void showNotification(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: primaryColor, content: Text(message.toString())));
}
