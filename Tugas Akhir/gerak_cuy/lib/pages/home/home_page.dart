import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gerak_cuy/main.dart';
import 'package:gerak_cuy/models/event_model.dart';
import 'package:gerak_cuy/models/user_model.dart';
import 'package:gerak_cuy/shared/theme.dart';
import 'package:gerak_cuy/widgets/carousel_image.dart';
import 'package:gerak_cuy/widgets/search_form.dart';
import 'package:gerak_cuy/widgets/sport_card.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController =
      TextEditingController(text: '');

  UserModel userModel = UserModel();
  EventModel eventModel = EventModel();

  User? loggedUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width * 0.45;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, '/add_event');
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(loggedUser!.uid)
                    .get()
                    .then(
                        (value) => userModel = UserModel.fromMap(value.data())),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Kesalahan terjadi\n${snapshot.error}',
                        textAlign: TextAlign.center,
                        style: redTextStyle,
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    return Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(userModel.foto!),
                          radius: 30,
                          foregroundColor: Colors.amber,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Halo ${userModel.fullName}',
                          style: blackTextStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                                minHeight: 60, minWidth: 20),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/add_event');
                                },
                                icon: const Icon(
                                  Icons.add_box_rounded,
                                  size: 40,
                                  color: primaryColor,
                                )),
                          ),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: const CarouselWithIndicatorDemo(),
              ),
              const SizedBox(height: 20),
              SearchFormField(
                hintText: 'Kamu pengen olahraga apa?',
                controller: searchController,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rekomendasi Olahraga',
                    style:
                        blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text('Lihat semua',
                          style: blueTextStyle.copyWith(fontSize: 15)))
                ],
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                  future: getEventsfromFirebase(loggedUser!.uid),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<EventModel> events = snapshot.data!;
                      return ListView.builder(
                          itemCount: events.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return SportCard(
                                width: cardWidth, eventModel: events[index]);
                          });
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

              // Padding(
              //   padding: const EdgeInsets.only(bottom: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       SportCard(
              //           width: cardWidth,
              //           judul: 'Jogging',
              //           lokasi: 'Jalan Bandulan 129',
              //           tanggal: '22-09-2022',
              //           kuota: 10,
              //           gambar:
              //               'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2021/11/04083947/bukan-cuma-membakar-kalori-ini-4-manfaat-jogging-di-pagi-hari-halodoc.jpg',
              //           waktu: '08.00'),
              //       SportCard(
              //           width: cardWidth,
              //           judul: 'Jogging',
              //           lokasi: 'Jalan Bandulan 129',
              //           tanggal: '22-09-2022',
              //           kuota: 10,
              //           gambar:
              //               'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2021/11/04083947/bukan-cuma-membakar-kalori-ini-4-manfaat-jogging-di-pagi-hari-halodoc.jpg',
              //           waktu: '08.00')
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       SportCard(
              //           width: cardWidth,
              //           judul: 'Jogging',
              //           lokasi: 'Jalan Bandulan 129',
              //           tanggal: '22-09-2022',
              //           kuota: 10,
              //           gambar:
              //               'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2021/11/04083947/bukan-cuma-membakar-kalori-ini-4-manfaat-jogging-di-pagi-hari-halodoc.jpg',
              //           waktu: '08.00'),
              //       SportCard(
              //           width: cardWidth,
              //           judul: 'Jogging',
              //           lokasi: 'Jalan Bandulan 129',
              //           tanggal: '22-09-2022',
              //           kuota: 10,
              //           gambar:
              //               'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2021/11/04083947/bukan-cuma-membakar-kalori-ini-4-manfaat-jogging-di-pagi-hari-halodoc.jpg',
              //           waktu: '08.00')
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
