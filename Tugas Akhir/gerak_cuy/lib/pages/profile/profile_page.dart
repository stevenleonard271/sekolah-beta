import 'package:flutter/material.dart';
import 'package:gerak_cuy/shared/theme.dart';
import 'package:gerak_cuy/widgets/custom_button.dart';
import 'package:gerak_cuy/widgets/custom_button_icon.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              const CircleAvatar(maxRadius: 50),
              const SizedBox(height: 10),
              Text(
                'Pengguna',
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
                    '0895395177691',
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButtonwithIcon(
                title: 'Edit Profil',
                icon: const Icon(
                  Icons.edit,
                  color: Colors.amber,
                ),
                titleStyle: amberTextStyle.copyWith(
                    fontSize: 15, fontWeight: FontWeight.bold),
                onPressed: () {
                  Navigator.pushNamed(context, '/edit_profile');
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
                onPressed: () {},
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
