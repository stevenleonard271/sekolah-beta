import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gerak_cuy/shared/theme.dart';

import '../../models/user_model.dart';

class ViewProfilePage extends StatelessWidget {
  ViewProfilePage({super.key});

  UserModel userModel = UserModel();

  User? loggedUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Lihat Profil',
          style: whiteTextStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: backgroundColor,
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(loggedUser!.uid)
            .get()
            .then((value) {
          return userModel = UserModel.fromMap(value.data());
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          maxRadius: 50,
                          backgroundImage: NetworkImage(userModel.foto == null
                              ? 'https://i.pinimg.com/736x/c9/e3/e8/c9e3e810a8066b885ca4e882460785fa.jpg'
                              : userModel.foto!),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          userModel.fullName == null
                              ? 'Belum ada nama'
                              : userModel.fullName!,
                          style: blackTextStyle.copyWith(
                              fontSize: 12, fontWeight: bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email :',
                            style: redTextStyle.copyWith(
                                fontSize: 15, fontWeight: bold),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            userModel.email!,
                            style: blackTextStyle.copyWith(
                                fontSize: 12, fontWeight: bold),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'No HP :',
                            style: redTextStyle.copyWith(
                                fontSize: 15, fontWeight: bold),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            userModel.nomor == null
                                ? 'Belum ada nomor'
                                : userModel.nomor!,
                            style: blackTextStyle.copyWith(
                                fontSize: 12, fontWeight: bold),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Alamat :',
                            style: redTextStyle.copyWith(
                                fontSize: 15, fontWeight: bold),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            userModel.alamat == null
                                ? 'Belum ada alamat'
                                : userModel.alamat!,
                            style: blackTextStyle.copyWith(
                                fontSize: 12, fontWeight: bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ));
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
          // print('=====test=======');
          // print(loggedUser!.uid);
          // print(userModel.email);
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
