import 'package:flutter/material.dart';
import 'package:flutter_mixup_tries_project/inn_app_web_browser_flutter/inn_app_web_browser_screen.dart';
import 'package:flutter_mixup_tries_project/speech_to_text/speech_to_text_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'popup_menu_list_view_builder_screen/popup_menu_list_view_builder_screen.dart';

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
        // home: const VideoPlayerScreen(),
        // home: const UploadPage(),
        // home: const SpeechToTextScreen(),
        // home: const InnAppWebBrowserScreen(),
        home: const PopUpMenuListViewBuilderScreen(),
      );
    });
  }
}
