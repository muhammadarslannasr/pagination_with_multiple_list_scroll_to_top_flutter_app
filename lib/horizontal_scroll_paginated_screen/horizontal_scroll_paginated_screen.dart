import 'package:flutter/material.dart';

class HorizontalScrollPaginatedScreen extends StatefulWidget {
  const HorizontalScrollPaginatedScreen({super.key});

  @override
  State<HorizontalScrollPaginatedScreen> createState() => _HorizontalScrollPaginatedScreenState();
}

class _HorizontalScrollPaginatedScreenState extends State<HorizontalScrollPaginatedScreen> {
  final ScrollController _scrollController = ScrollController();
  List<String> items = List.generate(20, (index) => 'Item $index');
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // reached the end of the list, load more items
        _loadMoreItems();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreItems() {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      // Simulate loading delay
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          items.addAll(List.generate(10, (index) => 'Item ${items.length}'));
          isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 40.0, // Adjust the width as needed
                  height: 40.0, // Adjust the height as needed
                  margin: const EdgeInsets.all(8.0),
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      items[index],
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),

          isLoading ? const CircularProgressIndicator() : Container(), // Show loading indicator when loading more items

          Text(
            'Some Footer',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
