import 'package:flutter/material.dart';

class FoundScreen extends StatelessWidget {
  final String value;
  final Function() screenClose;
  const FoundScreen({super.key, required this.value, required this.screenClose});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return RotatedBox(
            quarterTurns: 0,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
            ),
          );
        }),
        title: Text(
          'Result',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Result',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
