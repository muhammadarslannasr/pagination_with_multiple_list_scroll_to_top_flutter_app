package com.example.flutter_mixup_tries_project
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
class NativeDataFetcher(private val flutterEngine: FlutterEngine) {
    private val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.example/native")

    init {
        channel.setMethodCallHandler { call, result ->
            if (call.method == "getNativeData") {
                // Return data from native code
                result.success("Text from android!!!!")
            } else {
                result.notImplemented()
            }
        }
    }
}