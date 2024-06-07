import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class FlutterWebBrowserExampleScreen extends StatefulWidget {
  const FlutterWebBrowserExampleScreen({super.key});

  @override
  State<FlutterWebBrowserExampleScreen> createState() => _FlutterWebBrowserExampleScreenState();
}

class _FlutterWebBrowserExampleScreenState extends State<FlutterWebBrowserExampleScreen> {
  Future<void> openBrowserTab() async {
    await FlutterWebBrowser.openWebPage(url: "https://flutter.io/");
  }

  List<BrowserEvent> _events = [];

  StreamSubscription<BrowserEvent>? _browserEvents;

  @override
  void initState() {
    super.initState();

    _browserEvents = FlutterWebBrowser.events().listen((event) {
      setState(() {
        _events.add(event);
      });
    });
  }

  @override
  void dispose() {
    _browserEvents?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Browser'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => FlutterWebBrowser.warmup(),
                child: new Text('Warmup browser website'),
              ),
              ElevatedButton(
                onPressed: () => openBrowserTab(),
                child: new Text('Open Flutter website'),
              ),
              ElevatedButton(
                onPressed: () => openBrowserTab().then(
                  (value) => Future.delayed(
                    Duration(seconds: 5),
                    () => FlutterWebBrowser.close(),
                  ),
                ),
                child: new Text('Open Flutter website & close after 5 seconds'),
              ),
              if (Platform.isAndroid) ...[
                Text('test Android customizations'),
                ElevatedButton(
                  onPressed: () {
                    FlutterWebBrowser.openWebPage(
                      url: "https://flutter.io/",
                      customTabsOptions: CustomTabsOptions(
                        colorScheme: CustomTabsColorScheme.dark,
                        darkColorSchemeParams: CustomTabsColorSchemeParams(
                          toolbarColor: Colors.deepPurple,
                          secondaryToolbarColor: Colors.green,
                          navigationBarColor: Colors.amber,
                          navigationBarDividerColor: Colors.cyan,
                        ),
                        shareState: CustomTabsShareState.on,
                        instantAppsEnabled: true,
                        showTitle: true,
                        urlBarHidingEnabled: true,
                      ),
                    );
                  },
                  child: Text('Open Flutter website'),
                ),
              ],
              if (Platform.isIOS) ...[
                Text('test iOS customizations'),
                ElevatedButton(
                  onPressed: () {
                    FlutterWebBrowser.openWebPage(
                      url: "https://flutter.io/",
                      safariVCOptions: SafariViewControllerOptions(
                        barCollapsingEnabled: true,
                        preferredBarTintColor: Colors.green,
                        preferredControlTintColor: Colors.amber,
                        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
                        modalPresentationCapturesStatusBarAppearance: true,
                        modalPresentationStyle: UIModalPresentationStyle.popover,
                      ),
                    );
                  },
                  child: Text('Open Flutter website'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
