import 'dart:collection';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FlutterInAppWebViewBrowserScreen extends StatefulWidget {
  const FlutterInAppWebViewBrowserScreen({super.key});

  @override
  State<FlutterInAppWebViewBrowserScreen> createState() => _FlutterInAppWebViewBrowserScreenState();
}

class _FlutterInAppWebViewBrowserScreenState extends State<FlutterInAppWebViewBrowserScreen> {
  late final MyInAppBrowser browser;

  @override
  void initState() {
    super.initState();

    PullToRefreshController? pullToRefreshController = kIsWeb || ![TargetPlatform.iOS, TargetPlatform.android].contains(defaultTargetPlatform)
        ? null
        : PullToRefreshController(
            options: PullToRefreshOptions(
              color: Colors.black,
            ),
            onRefresh: () async {
              if (Platform.isAndroid) {
                browser.webViewController.reload();
              } else if (Platform.isIOS) {
                browser.webViewController.loadUrl(urlRequest: URLRequest(url: await browser.webViewController.getUrl()));
              }
            },
          );

    browser = MyInAppBrowser(pullToRefreshController: pullToRefreshController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "InAppBrowser",
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  await browser.openUrlRequest(
                    urlRequest: URLRequest(url: Uri.parse("https://flutter.dev")),
                    options: InAppBrowserClassOptions(
                      crossPlatform: InAppBrowserOptions(
                        toolbarTopBackgroundColor: Colors.blue,
                      ),
                    ),
                  );
                },
                child: const Text("Open In-App Browser")),
            Container(height: 40),
            ElevatedButton(
                onPressed: () async {
                  await InAppBrowser.openWithSystemBrowser(url: Uri.parse("https://flutter.dev/"));
                },
                child: const Text("Open System Browser")),
          ],
        ),
      ),
    );
  }
}

class MyInAppBrowser extends InAppBrowser {
  MyInAppBrowser({int? windowId, UnmodifiableListView<UserScript>? initialUserScripts, PullToRefreshController? pullToRefreshController})
      : super(
          windowId: windowId,
          initialUserScripts: initialUserScripts,
          // pullToRefreshController: pullToRefreshController,
          // webViewEnvironment: webViewEnvironment,
        );

  @override
  Future onBrowserCreated() async {
    print("\n\nBrowser Created!\n\n");
  }

  @override
  Future onLoadStart(url) async {
    debugPrint('onLoadStart: $url');
  }

  @override
  Future onLoadStop(url) async {
    debugPrint('onLoadStop: $url');
    pullToRefreshController?.endRefreshing();
  }

  @override
  void onLoadError(url, code, message) {
    pullToRefreshController?.endRefreshing();
  }

  @override
  void onProgressChanged(progress) {
    if (progress == 100) {
      pullToRefreshController?.endRefreshing();
    }
  }

  @override
  void onExit() {
    print("\n\nBrowser closed!\n\n");
  }

  @override
  Future<NavigationActionPolicy> shouldOverrideUrlLoading(navigationAction) async {
    print("\n\nOverride ${navigationAction.request.url}\n\n");
    return NavigationActionPolicy.ALLOW;
  }

  void onMainWindowWillClose() {
    close();
  }
}
