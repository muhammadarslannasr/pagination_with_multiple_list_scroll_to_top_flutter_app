import 'package:flutter/material.dart';
import 'package:flutter_mixup_tries_project/multiple_list_pagination_screen.dart';
import 'package:flutter_mixup_tries_project/sliver_app_bar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MultipleListPaginationScreen(),
      home: const SliverAppBarScreen(),
    );
  }
}
