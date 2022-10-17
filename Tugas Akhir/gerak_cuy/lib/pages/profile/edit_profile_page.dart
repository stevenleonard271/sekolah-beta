import 'package:flutter/material.dart';

import 'package:gerak_cuy/shared/theme.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namaController = TextEditingController(text: '');
    TextEditingController emailController = TextEditingController(text: '');
    TextEditingController nomorController = TextEditingController(text: '');
    TextEditingController alamatController = TextEditingController(text: '');
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Edit Profil',
          style: whiteTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                child: const CircleAvatar(maxRadius: 50),
                onTap: () {
                  print('Ambil foto');
                },
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
                    Navigator.pushNamed(context, '/add_next_event');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
