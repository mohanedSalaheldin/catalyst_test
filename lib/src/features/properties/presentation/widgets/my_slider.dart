import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../pages/properties_screen.dart';

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  final CarouselSliderController _pageController = CarouselSliderController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var items = [
      const PropertyImage(),
      const PropertyImage(),
      const PropertyImage(),
      const PropertyImage(),
      const PropertyImage(),
    ];
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _pageController,
          options: CarouselOptions(
            height: 280,
            aspectRatio: 1 / 1,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: items,
          disableGesture: true,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedSmoothIndicator(
              activeIndex: _currentIndex,
              count: items.length,
              effect: const WormEffect(
                dotWidth: 6.0,
                dotHeight: 6.0,
                activeDotColor: Colors.white,
                dotColor: Color.fromARGB(169, 255, 255, 255),
                spacing: 3,
                // expansionFactor: 2,
              ),
              onDotClicked: (index) {
                // _pageController.animateToPage(index);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class PropertyImage extends StatelessWidget {
  const PropertyImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          height: 300,
          width: 300,
          fit: BoxFit.cover,
          image: NetworkImage(
            src,
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color:
              Colors.black.withOpacity(0.2), // Adjust the darkness with opacity
        ),
      ],
    );
  }
}
