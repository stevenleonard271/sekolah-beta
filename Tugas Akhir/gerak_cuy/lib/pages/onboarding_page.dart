import 'package:flutter/material.dart';
import 'package:gerak_cuy/pages/sign_up_page.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../shared/theme.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width * 0.8;
    final pageDecoration = PageDecoration(
        titleTextStyle: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
        bodyTextStyle: blackTextStyle.copyWith(fontSize: 15),
        imageFlex: 3,
        bodyFlex: 3);
    return IntroductionScreen(
      isBottomSafeArea: true,
      isTopSafeArea: true,
      globalBackgroundColor: backgroundColor,
      pages: [
        PageViewModel(
          decoration: pageDecoration,
          title: "Olahraga bareng temen temen baru",
          body:
              "Bosen olahraga sendirian? Kini dengan GerakCuy, olahraga jadi lebih seru bareng temen-temen baru",
          image:
              Image.asset('assets/jogging.png', width: imageWidth, height: 200),
        ),
        PageViewModel(
          decoration: pageDecoration,
          title: "Banyak relasi dengan GerakCuy",
          body:
              "Cari temen-temen atau komunitas olahraga baru jadi lebih cepat dan mudah dengan GerakCuy.",
          image:
              Image.asset('assets/friend.png', width: imageWidth, height: 200),
        ),
        PageViewModel(
          decoration: pageDecoration,
          title: "Ikut atau buat kegiatan olahraga yang beragam",
          body:
              "Kamu bisa ikut atau adain berbagai kegiatan olahraga lainnya seperti jogging, futsal, basket, bulu tangkis, renang, dll.",
          image: Image.asset('assets/goal.png', width: imageWidth, height: 200),
        ),
      ],
      done: Text('Done',
          style: blueTextStyle.copyWith(fontSize: 15, fontWeight: bold)),
      onDone: () {
        Navigator.pushReplacementNamed(context, '/sign-up');
      },
      showSkipButton: true,
      showBackButton: false,
      skip: Text('Skip', style: blueTextStyle.copyWith(fontSize: 13)),
      showDoneButton: true,
      showNextButton: true,
      next: Text(
        'Next',
        style: blueTextStyle.copyWith(fontSize: 13),
      ),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Colors.blue,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
