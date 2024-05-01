import 'package:flutter/material.dart';
import 'package:flutter_mixup_tries_project/aligned_column_inner_row.dart';
import 'package:flutter_mixup_tries_project/barcode_scanner_with_overlay/bar_code_scanner_with_overlay.dart';
import 'package:flutter_mixup_tries_project/customCarousel/custom_carousel_slider.dart';
import 'package:flutter_mixup_tries_project/flutter_barcode_scanner_screen/flutter_barcode_scanner_screen.dart';
import 'package:flutter_mixup_tries_project/horizontal_scroll_paginated_screen/horizontal_scroll_paginated_screen.dart';
import 'package:flutter_mixup_tries_project/modal_full_background/main_screen.dart';
import 'package:flutter_mixup_tries_project/scanner/scanner_screen.dart';
import 'package:flutter_mixup_tries_project/video_player_screen/video_player_screen.dart';
import 'package:flutter_mixup_tries_project/whatsapp_send_image_screen/whatsapp_send_image_screen.dart';
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
        // home: const HorizontalScrollPaginatedScreen(),
        // home: const WhatsAppSendImageScreen(),
        // home: const ScannerScreen(),
        // home: const BarcodeScannerWithOverlay(),
        // home: const FlutterBarCodeScannerScreen(),
        home: const VideoPlayerScreen(),
      );
    });
  }
}
