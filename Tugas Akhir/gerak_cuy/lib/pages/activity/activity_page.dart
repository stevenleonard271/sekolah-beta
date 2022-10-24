import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gerak_cuy/shared/theme.dart';

import '../../main.dart';
import '../../models/event_model.dart';
import '../../models/user_model.dart';
import '../../widgets/sport_card.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserModel();
    User? loggedUser = FirebaseAuth.instance.currentUser;
    final double cardWidth = MediaQuery.of(context).size.width * 0.45;

    // Future<Usern test() async {

    // FirebaseFirestore.instance.collection('users').doc(loggedUser!.uid).get().then((value) {
    //       return userModel = UserModel.fromMap(value.data());}

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Aktivitas',
                    style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Dibuat',
                  style: blackTextStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 10),
                FutureBuilder(
                    future: getCreatedEventfromFirebase(loggedUser!.uid),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<EventModel> events = snapshot.data!;
                        return ListView.builder(
                            itemCount: events.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return SportCard(
                                  button: false,
                                  width: cardWidth,
                                  eventModel: events[index]);
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
                Text(
                  'Tergabung',
                  style: blackTextStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 20),
                FutureBuilder(
                    future: getJoinedfromFirebase(loggedUser.uid),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<EventModel> events = snapshot.data!;
                        return ListView.builder(
                            itemCount: events.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return SportCard(
                                  button: false,
                                  width: cardWidth,
                                  eventModel: events[index]);
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
              ],
            ),
          ),
        ));
  }
}
