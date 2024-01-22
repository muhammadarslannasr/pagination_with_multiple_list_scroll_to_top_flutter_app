import 'dart:async';

import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final List<String> images = [
    'https://1sw-assets.s3.ap-northeast-2.amazonaws.com/banner-1.png',
    'https://1sw-assets.s3.ap-northeast-2.amazonaws.com/banner-2.png',
    'https://1sw-assets.s3.ap-northeast-2.amazonaws.com/banner-3.png',
    'https://1sw-assets.s3.ap-northeast-2.amazonaws.com/banner-4.png',
  ];

  int currentIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: currentIndex,
      viewportFraction: 1.0,
    );
    _startAutoPlay();
  }

  void _startAutoPlay() {
    const Duration autoPlayDuration = Duration(seconds: 4);

    _timer = Timer.periodic(autoPlayDuration, (timer) {
      if (currentIndex < images.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Carousel Custom'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 300,
              child: PageView.builder(
                itemCount: images.length,
                controller: _pageController,
                allowImplicitScrolling: true,
                // controller: PageController(
                //   initialPage: currentIndex,
                //   viewportFraction: 1.0,
                // ),
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Current Index: $currentIndex',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Replace the existing image with a new one
                if (currentIndex < images.length - 1) {
                  setState(() {
                    currentIndex++;
                  });
                }
              },
              child: const Text('Next Image'),
            ),
          ],
        ),
      ),
    );
  }
}
