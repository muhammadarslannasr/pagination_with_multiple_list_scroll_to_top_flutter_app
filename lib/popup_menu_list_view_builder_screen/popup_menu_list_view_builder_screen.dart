import 'package:flutter/material.dart';

class PopUpMenuListViewBuilderScreen extends StatefulWidget {
  const PopUpMenuListViewBuilderScreen({super.key});

  @override
  State<PopUpMenuListViewBuilderScreen> createState() => _PopUpMenuListViewBuilderScreenState();
}

class _PopUpMenuListViewBuilderScreenState extends State<PopUpMenuListViewBuilderScreen> {
  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView with PopupMenuButton'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(items[index]),
                  trailing: PopupMenuButton<String>(
                    position: PopupMenuPosition.under,
                    //offset: const Offset(0, 32),
                    itemBuilder: (BuildContext context) {
                      return ['Edit', 'Delete'].map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                    onSelected: (String choice) {
                      // Handle menu item selection
                      if (choice == 'Edit') {
                        // Implement edit functionality
                        print('Edit item: ${items[index]}');
                      } else if (choice == 'Delete') {
                        // Implement delete functionality
                        print('Delete item: ${items[index]}');
                      }
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
