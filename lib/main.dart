import 'package:flutter/material.dart';
import 'package:flutter_mixup_tries_project/aligned_column_inner_row.dart';
import 'package:flutter_mixup_tries_project/customCarousel/custom_carousel_slider.dart';
import 'package:flutter_mixup_tries_project/horizontal_scroll_paginated_screen/horizontal_scroll_paginated_screen.dart';
import 'package:flutter_mixup_tries_project/modal_full_background/main_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const MultipleListPaginationScreen(),
        // home: const SliverAppBarScreen(),
        // home: const AlignedColumnInnerRow(),
        // home: const MainScreen(),
        // home: const CustomCarouselSlider(),
        home: const HorizontalScrollPaginatedScreen(),
      );
    });
  }
}
