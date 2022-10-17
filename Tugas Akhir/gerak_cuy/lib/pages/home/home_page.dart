import 'package:flutter/material.dart';
import 'package:gerak_cuy/shared/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gerak_cuy/widgets/search_form.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController searchController =
      TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    foregroundColor: Colors.amber,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Halo Steven',
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: semiBold),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(minHeight: 60, minWidth: 20),
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
              ),
              const SizedBox(height: 20),
              SearchFormField(
                hintText: 'Kamu pengen olahraga apa?',
                controller: searchController,
              ),
              const SizedBox(height: 20),
              Text(
                'Rekomendasi Olahraga',
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({super.key});
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> myData = [
    Container(
      width: 200,
      height: 200,
      color: Colors.blue,
    ),
    Container(
      width: 200,
      height: 200,
      color: Colors.red,
    ),
    Container(
      width: 200,
      height: 200,
      color: Colors.amber,
    ),
    Container(
      width: 200,
      height: 200,
      color: Colors.green,
    ),
    Container(
      width: 200,
      height: 200,
      color: Colors.yellow,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Carousel with indicator controller demo')),
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: myData,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: myData.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
