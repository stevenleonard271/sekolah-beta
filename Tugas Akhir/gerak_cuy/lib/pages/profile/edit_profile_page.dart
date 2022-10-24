import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:gerak_cuy/shared/theme.dart';

import '../../models/user_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  UserModel userModel = UserModel();

  User? loggedUser = FirebaseAuth.instance.currentUser;
  final _auth = FirebaseAuth.instance;

  TextEditingController namaController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController nomorController = TextEditingController(text: '');
  TextEditingController alamatController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Edit Profil',
          style: whiteTextStyle,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(loggedUser!.uid)
                .get()
                .then((value) {
              return userModel = UserModel.fromMap(value.data());
            }),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    GestureDetector(
                      child: CircleAvatar(
                        maxRadius: 50,
                        backgroundImage: NetworkImage(userModel.foto!),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                        hintText: 'Nama Lengkap',
                        title: 'Nama Lengkap',
                        prefix: const Icon(Icons.person),
                        margin: const EdgeInsets.only(bottom: 20),
                        controller: namaController),
                    CustomTextFormField(
                        hintText: 'Email',
                        title: 'Email',
                        prefix: const Icon(Icons.email),
                        margin: const EdgeInsets.only(bottom: 20),
                        controller: emailController),
                    CustomTextFormField(
                        hintText: 'Nomor HP',
                        title: 'Nomor HP',
                        prefix: const Icon(Icons.phone_android),
                        margin: const EdgeInsets.only(bottom: 20),
                        controller: nomorController),
                    CustomTextFormField(
                        hintText: 'Alamat',
                        title: 'Alamat',
                        prefix: const Icon(Icons.location_on),
                        margin: const EdgeInsets.only(bottom: 20),
                        controller: alamatController),
                    CustomButton(
                        title: 'Edit Profil',
                        onPressed: () {
                          editProfile();
                          Navigator.pop(context);
                        })
                  ],
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Kesalahan terjadi\n${snapshot.error}',
                    textAlign: TextAlign.center,
                    style: redTextStyle,
                  ),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }

  void editProfile() async {
    try {
      String? nama =
          namaController.text == "" ? userModel.fullName : namaController.text;
      String? email =
          emailController.text == "" ? userModel.email : emailController.text;
      String? nomor =
          nomorController.text == "" ? userModel.nomor : nomorController.text;
      String? alamat = alamatController.text == ""
          ? userModel.alamat
          : alamatController.text;

      userModel.fullName = nama;
      userModel.email = email;
      userModel.nomor = nomor;
      userModel.alamat = alamat;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(loggedUser!.uid)
          .update({
        'fullName': userModel.fullName,
        'email': userModel.email,
        'nomor': userModel.nomor,
        'alamat': userModel.alamat,
      });
    } catch (e) {
      var errorSnackBar = const SnackBar(
        content: Text('Tidak Tersimpan'),
        backgroundColor: Colors.red,
      );
      // ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
    }
  }
}
