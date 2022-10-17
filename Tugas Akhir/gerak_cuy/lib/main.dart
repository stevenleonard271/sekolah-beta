import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gerak_cuy/pages/home/add_event.dart';
import 'package:gerak_cuy/pages/controller_page.dart';
import 'package:gerak_cuy/pages/home/home_page.dart';
import 'package:gerak_cuy/pages/auth/onboarding_page.dart';
import 'package:gerak_cuy/pages/auth/sign_in_page.dart';
import 'package:gerak_cuy/pages/auth/sign_up_page.dart';
import 'pages/activity/activity_page.dart';
import 'pages/home/add_next_event.dart';
import 'pages/profile/edit_profile_page.dart';
import 'pages/notification/notification_page.dart';
import 'pages/profile/profile_page.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const OnboardingPage(),
      routes: {
        // '/sign-in': (context) => SignInScreen(),
        '/sign-up': (context) => SignUpPage(),
        '/sign-in': (context) => SignInPage(),
        '/controller': (context) => ControllerPage(),
        '/home': (context) => HomePage(),
        '/activity': (context) => ActivityPage(),
        '/notification': (context) => NotificationPage(),
        '/profile': (context) => ProfilePage(),
        '/edit_profile': (context) => EditProfilePage(),
        '/add_event': (context) => AddEvent(),
        '/add_next_event': (context) => AddNextEvent(),
      },
    );
  }
}
