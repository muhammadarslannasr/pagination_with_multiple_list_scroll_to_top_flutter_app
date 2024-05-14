import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

class InnAppWebBrowserScreen extends StatefulWidget {
  const InnAppWebBrowserScreen({super.key});

  @override
  State<InnAppWebBrowserScreen> createState() => _InnAppWebBrowserScreenState();
}

class _InnAppWebBrowserScreenState extends State<InnAppWebBrowserScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Custom Tabs Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () async {
            await _launchURLInDefaultBrowserOnAndroid(context);
          },
          child: Text(
            'Launch Default Browser',
          ),
        ),
      ),
    );
  }

  Future<void> _launchURLInDefaultBrowserOnAndroid(BuildContext context) async {
    final theme = Theme.of(context);
    try {
      await launchUrl(
        Uri.parse('https://flutter.dev'),
        customTabsOptions: CustomTabsOptions(
          colorSchemes: CustomTabsColorSchemes.defaults(
            toolbarColor: theme.colorScheme.surface,
            navigationBarColor: theme.colorScheme.background,
          ),
          urlBarHidingEnabled: true,
          showTitle: true,
          browser: const CustomTabsBrowserConfiguration(
            prefersDefaultBrowser: true,
          ),
        ),
        safariVCOptions: SafariViewControllerOptions(
          preferredBarTintColor: theme.colorScheme.surface,
          preferredControlTintColor: theme.colorScheme.onSurface,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
