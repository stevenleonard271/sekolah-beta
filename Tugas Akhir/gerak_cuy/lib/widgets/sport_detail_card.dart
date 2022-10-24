import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gerak_cuy/main.dart';
import 'package:gerak_cuy/models/event_model.dart';
import 'package:gerak_cuy/widgets/colored_status.dart';
import 'package:gerak_cuy/widgets/custom_button_icon.dart';
import 'package:gerak_cuy/widgets/joined_users_list.dart';

import '../models/user_model.dart';
import '../shared/theme.dart';
import 'custom_button.dart';

class SportDetailPage extends StatelessWidget {
  const SportDetailPage(
      {super.key,
      required this.eventId,
      required this.userJoin,
      required this.lokasi,
      required this.catatan,
      required this.judul,
      required this.jenis,
      required this.userId,
      required this.kuota,
      required this.tanggal,
      required this.gambar,
      this.button = true,
      required this.waktu});

  final bool button;
  final String lokasi;
  final int userJoin;
  final String judul;
  final String eventId;
  final String userId;
  final String catatan;
  final String jenis;
  final int kuota;
  final String tanggal;
  final String waktu;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    String loggedUser = FirebaseAuth.instance.currentUser!.uid;
    UserModel userModel = UserModel();
    ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Detail Olahraga',
          style: whiteTextStyle,
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.37,
            child: Image.network(
              gambar,
              width: double.infinity,
            ),
          ),
          Text(
            '${judul} - ${jenis}',
            style: blackTextStyle.copyWith(
                fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.lightBlue.shade200,
            ),
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('users')
                        .doc(userId)
                        .get()
                        .then((value) {
                      return userModel = UserModel.fromMap(value.data());
                    }),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Row(
                          children: [
                            CircleAvatar(
                              maxRadius: 30,
                              backgroundImage: NetworkImage(userModel.foto!),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userModel.fullName!,
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.phone_android,
                                      color: Colors.green,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      userModel.nomor!,
                                      style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Spacer(),
                            ColoredStatus(
                              textColor: Colors.white,
                              name: 'Lihat Peserta',
                              color: Colors.amber,
                              onTap: () {
                                showModalBottomSheet(
                                    backgroundColor: backgroundColor,
                                    context: context,
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    builder: (context) {
                                      return DraggableScrollableSheet(
                                        expand: false,
                                        initialChildSize: 0.5,
                                        builder: (context, scrollController) =>
                                            SingleChildScrollView(
                                          controller: scrollController,
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 20),
                                              Text(
                                                'Peserta yang bergabung',
                                                style: blackTextStyle.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                              ),
                                              const SizedBox(height: 10),
                                              FutureBuilder(
                                                future:
                                                    getJoinedUsersFromFirebase(
                                                        eventId),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    List<UserModel> users =
                                                        snapshot.data!;
                                                    return ListView.builder(
                                                        itemCount: users.length,
                                                        shrinkWrap: true,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return JoinedUsersList(
                                                              userModel:
                                                                  users[index]);
                                                        });
                                                  }
                                                  if (snapshot.hasError) {
                                                    return Center(
                                                      child: Text(
                                                        "An Error Has Occured:\n'${snapshot.error}",
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    );
                                                  }
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                },
                                              )

                                              // FutureBuilder(
                                              //     future: FirebaseFirestore
                                              //         .instance
                                              //         .collection('events')
                                              //         .where('eventId',
                                              //             isEqualTo: eventId)
                                              //         .get()
                                              //         .then((value) {
                                              //       return userModel;
                                              //     }),
                                              //     builder:
                                              //         (context, snapshot) {
                                              //           if(snapshot.hasData){

                                              //           }
                                              //         }),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                            )
                          ],
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "An Error Has Occured:\n'${snapshot.error}",
                            textAlign: TextAlign.center,
                          ),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      lokasi,
                      style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.people,
                      color: Colors.blueAccent,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${userJoin.toString()}' '/' '${kuota} orang',
                      style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.calendar_month, color: Colors.amber),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      tanggal,
                      style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.timer, color: Colors.green),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      waktu,
                      style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Catatan :',
                      style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      catatan,
                      style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          button
              ? CustomButton(
                  title: 'Join',
                  onPressed: () {
                    joinEvent(loggedUser, eventId, context);
                  },
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 10))
              : SizedBox()
        ]),
      ),
    );
  }

  void joinEvent(
      String loggedUser, String eventId, BuildContext context) async {
    try {
      if (userJoin < kuota) {
        await FirebaseFirestore.instance
            .collection('events')
            .doc(eventId)
            .update({
          'userJoin': FieldValue.arrayUnion([loggedUser])
        });
      } else {
        var snackBar = SnackBar(content: Text('Kuota sudah terpenuhi'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      // await FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(loggedUser)
      //     .update({'joinedEvents': eventId});

      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }
}
