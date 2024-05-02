import 'package:flutter/services.dart';

class NativeCommunicator {
  static const platform = MethodChannel('com.example/native');

  static Future<String> getNativeData() async {
    final String result = await platform.invokeMethod('getNativeData');
    return result;
  }
}
