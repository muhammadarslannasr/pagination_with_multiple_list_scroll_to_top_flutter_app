import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BottomBar(),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Bar Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the NestedScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NestedScreen()),
            );
          },
          child: Text('Open Nested Screen'),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // Your BottomNavigationBar here
        child: Container(
          height: 50.0,
          color: Colors.blue,
          child: Center(
            child: Text('Bottom Navigation Bar'),
          ),
        ),
      ),
    );
  }
}

class NestedScreen extends StatelessWidget {
  const NestedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nested Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show the full-screen modal for NestedScreen
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Close the modal
                        Navigator.of(context).pop();
                      },
                      child: Text('Close Modal'),
                    ),
                  ),
                );
              },
            );
          },
          child: Text('Open Full-Screen Modal'),
        ),
      ),
    );
  }
}
