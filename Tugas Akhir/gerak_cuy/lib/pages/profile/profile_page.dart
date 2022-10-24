import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gerak_cuy/shared/theme.dart';
import 'package:gerak_cuy/widgets/custom_button.dart';
import 'package:gerak_cuy/widgets/custom_button_icon.dart';

import '../../models/user_model.dart';
import '../auth/sign_in_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  UserModel userModel = UserModel();

  User? loggedUser = FirebaseAuth.instance.currentUser;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    void signOut() async {
      try {
        await auth.signOut();
        Navigator.pushNamedAndRemoveUntil(
            context, '/sign-in', (route) => false);
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Profil',
                style: blackTextStyle.copyWith(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              FutureBuilder(
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
                        children: [
                          CircleAvatar(
                              maxRadius: 50,
                              backgroundImage: NetworkImage(userModel.foto!)),
                          const SizedBox(height: 10),
                          Text(
                            userModel.fullName!,
                            style: blackTextStyle.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.phone_android,
                                color: Colors.green,
                                size: 25,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                userModel.nomor == null
                                    ? 'Belum ada nomor'
                                    : userModel.nomor!,
                                style: blackTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
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
                    return const Center(child: CircularProgressIndicator());
                  }),
              const SizedBox(height: 20),
              CustomButtonwithIcon(
                title: 'Lihat Profil',
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: Colors.green,
                ),
                titleStyle: greenTextStyle.copyWith(
                    fontSize: 15, fontWeight: FontWeight.bold),
                onPressed: () {
                  Navigator.pushNamed(context, '/view_profile',
                      arguments: loggedUser);
                },
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              ),
              CustomButtonwithIcon(
                title: 'Edit Profil',
                icon: const Icon(
                  Icons.edit,
                  color: Colors.amber,
                ),
                titleStyle: amberTextStyle.copyWith(
                    fontSize: 15, fontWeight: FontWeight.bold),
                onPressed: () {
                  Navigator.pushNamed(context, '/edit_profile',
                      arguments: loggedUser);
                },
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              ),
              CustomButtonwithIcon(
                title: 'Bantuan',
                icon: const Icon(
                  Icons.help,
                  color: Colors.blueAccent,
                ),
                titleStyle: blueTextStyle.copyWith(
                    fontSize: 15, fontWeight: FontWeight.bold),
                onPressed: () {},
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              ),
              CustomButtonwithIcon(
                title: 'Keluar',
                icon: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                titleStyle: redTextStyle.copyWith(
                    fontSize: 15, fontWeight: FontWeight.bold),
                onPressed: () {
                  signOut();
                },
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              ),
              const SizedBox(height: 30),
              Text(
                'Versi 1.0',
                style: blackTextStyle.copyWith(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Made by',
                    style: blackTextStyle.copyWith(
                        fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Steven Leonard',
                    style: blackTextStyle.copyWith(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// void signOut() async {
//   try {
//     await _auth.signOut();
//     var snackBar = const SnackBar(
//       content: Text('Berhasil Keluar'),
//       duration: Duration(milliseconds: 700),
//       backgroundColor: Colors.green,
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (context) => const Login()),
//         (route) => false);
//   } catch (e) {
//     var errorSnackBar = const SnackBar(
//       content: Text('Tidak Keluar'),
//       backgroundColor: Colors.red,
//     );
//     ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
//   }
// }
