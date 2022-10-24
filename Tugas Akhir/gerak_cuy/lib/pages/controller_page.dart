import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:gerak_cuy/pages/activity/activity_page.dart';
import 'package:gerak_cuy/pages/history/history_page.dart';
import 'package:gerak_cuy/pages/home/home_page.dart';

import 'package:gerak_cuy/pages/profile/profile_page.dart';
import '../shared/theme.dart';
import 'package:flutter/material.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  int selectedPage = 0;
  final _pages = [
    HomePage(),
    const ActivityPage(),
    HistoryPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedPage],
      backgroundColor: backgroundColor,
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        items: const [
          TabItem(icon: Icons.home, title: 'Beranda'),
          TabItem(icon: Icons.calendar_month, title: 'Jadwal'),
          TabItem(icon: Icons.history, title: 'Riwayat'),
          TabItem(icon: Icons.person, title: 'Profil'),
        ],
        initialActiveIndex: selectedPage,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
        activeColor: Colors.white,
        backgroundColor: primaryColor,
      ),
    );
  }
}
