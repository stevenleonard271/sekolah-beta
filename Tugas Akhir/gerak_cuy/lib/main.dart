import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gerak_cuy/models/event_model.dart';
import 'package:gerak_cuy/pages/history/history_page.dart';
import 'package:gerak_cuy/pages/home/add_event.dart';
import 'package:gerak_cuy/pages/controller_page.dart';
import 'package:gerak_cuy/pages/home/home_page.dart';
import 'package:gerak_cuy/pages/auth/onboarding_page.dart';
import 'package:gerak_cuy/pages/auth/sign_in_page.dart';
import 'package:gerak_cuy/pages/auth/sign_up_page.dart';
import 'package:gerak_cuy/pages/profile/view_profile.dart';

import 'models/user_model.dart';
import 'pages/activity/activity_page.dart';
import 'pages/profile/edit_profile_page.dart';
import 'pages/profile/profile_page.dart';

void main() async {
//   const firebaseConfig = {

// };
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyClrNFiho2CwE_0ensUR6HmDWRIi--b2VU",
          authDomain: "gerakcuy-93803.firebaseapp.com",
          projectId: "gerakcuy-93803",
          storageBucket: "gerakcuy-93803.appspot.com",
          messagingSenderId: "505341361474",
          appId: "1:505341361474:web:78de38a5c140669a82dcdb"));

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(),
      routes: {
        // '/sign-in': (context) => SignInScreen(),
        '/sign-up': (context) => SignUpPage(),
        '/sign-in': (context) => SignInPage(),
        '/controller': (context) => ControllerPage(),
        '/home': (context) => HomePage(),
        '/activity': (context) => ActivityPage(),
        '/history': (context) => HistoryPage(),
        '/profile': (context) => ProfilePage(),
        '/edit_profile': (context) => EditProfilePage(),
        '/view_profile': (context) => ViewProfilePage(),
        '/add_event': (context) => AddEvent(),
      },
    );
  }
}

Future<List<EventModel>> getEventsfromFirebase(String userId) async {
  return FirebaseFirestore.instance
      .collection('events')
      .where('userId', isNotEqualTo: userId)
      .get()
      .then((value) => List<EventModel>.generate(value.docs.length, (index) {
            DocumentSnapshot doc = value.docs[index];
            return EventModel.fromMap(doc);
          }));
}

Future<List<EventModel>> getCreatedEventfromFirebase(String userId) async {
  return await FirebaseFirestore.instance
      .collection('events')
      .where('userId', isEqualTo: userId)
      .get()
      .then((value) => List<EventModel>.generate(value.docs.length, (index) {
            DocumentSnapshot doc = value.docs[index];
            return EventModel.fromMap(doc);
          }));
}

Future<List<EventModel>> getJoinedfromFirebase(String userId) async {
  return await FirebaseFirestore.instance
      .collection('events')
      .where('userJoin', arrayContains: userId)
      .get()
      .then((value) => List<EventModel>.generate(value.docs.length, (index) {
            DocumentSnapshot doc = value.docs[index];
            return EventModel.fromMap(doc);
          }));
}

// Future<List<UserModel>> getJoinedUsersfromFirebase(String eventId) {

//   Future <List <dynamic>> getDatabase =   FirebaseFirestore.instance
//       .collection('events').doc(eventId)
//       .get()
//       .then((value) => value.data['userJoin']);

//   return FirebaseFirestore.instance.collection('users').where('userId', isEqualTo: getDatabase).
// }
Future<EventModel> getEvent(String eventId) async {
  final data = await FirebaseFirestore.instance
      .collection('events')
      .doc(eventId)
      .get()
      .then((value) => EventModel.fromMap(value.data()));
  return data;
}

Future<List<UserModel>> getJoinedUsersFromFirebase(String eventId) async {
  final event = await getEvent(eventId);
  return await FirebaseFirestore.instance
      .collection('users')
      .where('uid', whereIn: event.userJoin)
      .get()
      .then((value) => List<UserModel>.generate(value.docs.length, (index) {
            DocumentSnapshot doc = value.docs[index];
            return UserModel.fromMap(doc);
          }));
}
