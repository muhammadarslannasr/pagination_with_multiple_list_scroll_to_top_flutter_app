import 'package:flutter/material.dart';
import 'package:flutter_mixup_tries_project/card_validations_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:pylons_sdk/pylons_sdk.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  PylonsWallet.setup(mode: PylonsMode.prod, host: 'my.host.genesis.arslan');

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
        // home: const PopUpMenuListViewBuilderScreen(),
        // home: const PylonsSdkScreen(),
        // home: const TextFormFieldFormatterScreen(),
        // home: const CustomPainterExample(),
        home: const CardValidationsScreen(),
      );
    });
  }
}
