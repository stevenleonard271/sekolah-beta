import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          children: [
            Container(
              color: Color(0xffBEFCFF),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/jogging.png',
                      width: 350,
                      height: 250,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Olahraga Bareng',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        'lorem ipsum adawdwfqiwnqwlkrqnrqkrklqwrlqwkklrnnqwkrnkqlkrnqnkrknl',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black, fontSize: 15)),
                      ),
                    )
                  ]),
            ),
            Container(
              color: Colors.indigo,
              child: const Center(
                child: Text('Page 2'),
              ),
            ),
            Container(
              color: Colors.green,
              child: const Center(
                child: Text('Page 3'),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  controller.jumpToPage(2);
                },
                child: const Text('SKIP')),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.black26,
                  activeDotColor: Colors.teal.shade700,
                ),
                onDotClicked: (index) => controller.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn),
              ),
            ),
            TextButton(onPressed: () {}, child: const Text('NEXT')),
          ],
        ),
      ),
    );
  }
}
