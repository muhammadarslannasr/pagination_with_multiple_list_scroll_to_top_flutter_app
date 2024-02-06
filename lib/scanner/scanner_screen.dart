import 'package:flutter/material.dart';
import 'package:flutter_mixup_tries_project/scanner/found_screen.dart';
import 'package:flutter_mixup_tries_project/scanner/qr_scanner_overlay.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  MobileScannerController cameraController = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
    autoStart: true,
  );
  bool _screenOpened = false;

  @override
  void initState() {
    super.initState();
    // this._screenWasClosed();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'Scanner',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          MobileScanner(
            onDetect: _foundBarcode,
            controller: cameraController,
          ),
          QRScannerOverlay(
            overlayColour: Colors.black.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ValueListenableBuilder<TorchState>(
                    valueListenable: cameraController.torchState,
                    builder: (context, value, child) {
                      final Color iconColor;

                      switch (value) {
                        case TorchState.off:
                          iconColor = Colors.white;
                        case TorchState.on:
                          iconColor = Colors.yellow;
                      }

                      return IconButton(
                        onPressed: () => cameraController.toggleTorch(),
                        icon: Icon(
                          Icons.flashlight_on,
                          color: iconColor,
                        ),
                      );
                    },
                  ),
                  IconButton(
                    onPressed: () => cameraController.switchCamera(),
                    icon: const Icon(
                      Icons.cameraswitch_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _foundBarcode(BarcodeCapture barcodeCapture) {
    debugPrint('$barcodeCapture');
    // if (!_screenOpened) {
    final barcode = barcodeCapture.barcodes.last;
    final String code = barcodeCapture.barcodes.last.displayValue ?? barcode.rawValue ?? 'Barcode has no displayable value';
    _screenOpened = false;
    debugPrint('QRCode: $code');

    /// here push navigation result page
    Navigator.push(context, MaterialPageRoute(builder: (context) => FoundScreen(value: code, screenClose: _screenWasClosed)));
    // }
  }

  void _screenWasClosed() {
    _screenOpened = false;
  }
}
