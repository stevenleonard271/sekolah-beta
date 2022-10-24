import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gerak_cuy/shared/theme.dart';

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

  @override
  Widget build(BuildContext context) {
    final double dynamicWidth = MediaQuery.of(context).size.width;
    // final double dynamicHeight = MediaQuery.of(context).size.height * 0.2;

    final List<String> imgList = [
      'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2021/11/04083947/bukan-cuma-membakar-kalori-ini-4-manfaat-jogging-di-pagi-hari-halodoc.jpg',
      'https://assets.bupa.co.uk/~/media/images/healthmanagement/blogs/700-350/2021/oct/football-700-350.jpg',
      'https://akcdn.detik.net.id/visual/2021/08/05/olympics-2020-bkbm-team5-sfnl-000100-1_169.jpeg?w=650',
      'https://previews.123rf.com/images/stockbroker/stockbroker1506/stockbroker150604328/42398011-group-of-friends-relaxing-in-swimming-pool-together.jpg',
      'https://hips.hearstapps.com/hmg-prod/images/mff-roka-0618-1-preview-maxwidth-3000-maxheight-3000-ppi-300-quality-90-1620433208.jpg',
      'https://blog.playo.co/wp-content/uploads/2017/03/badminton-sociazlizing.jpg',
      'https://asset.kompas.com/crops/e4VlAu_71Ou9xA2Ycp2rmWqtAvY=/11x0:1000x659/750x500/data/photo/2018/08/29/2586769635.jpg'
    ];

    final List<Widget> imageSliders = imgList
        .map(
          (item) => Container(
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item,
                        fit: BoxFit.fill, width: double.infinity),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        )
        .toList();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(children: [
        Expanded(
          flex: 3,
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
                autoPlayAnimationDuration: const Duration(seconds: 1),
                aspectRatio: 2,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 10.0,
                height: 10.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? primaryColor
                            : primaryColor)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
