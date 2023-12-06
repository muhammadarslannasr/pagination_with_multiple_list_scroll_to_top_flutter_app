import 'package:flutter/material.dart';

class MultipleListPaginationScreen extends StatefulWidget {
  const MultipleListPaginationScreen({super.key});

  @override
  State<MultipleListPaginationScreen> createState() =>
      _MultipleListPaginationScreenState();
}

class _MultipleListPaginationScreenState
    extends State<MultipleListPaginationScreen> {
  List<String> itemList1 = [];
  List<String> itemList2 = [];

  int currentPage1 = 1;
  int currentPage2 = 1;

  bool isLoadingList1 = false;
  bool isLoadingList2 = false;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Initialize data for the first page of each list
    itemList1 = fetchDataForPage(currentPage1);
    itemList2 = fetchDataForPage(currentPage2);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _loadMoreData(int listNumber) {
    // Fetch more data based on the current page for the specified list

    setState(() {
      if (listNumber == 1) {
        isLoadingList1 = true;
      } else {
        isLoadingList2 = true;
      }
    });

    // Simulate fetching data from an API or other source
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        if (listNumber == 1) {
          itemList1.addAll(fetchDataForPage(++currentPage1));
          isLoadingList1 = false;
        } else {
          itemList2.addAll(fetchDataForPage(++currentPage2));
          isLoadingList2 = false;
        }
      });
    });

    // if (listNumber == 1) {
    //   setState(() {
    //     itemList1.addAll(fetchDataForPage(++currentPage1));
    //   });
    // } else if (listNumber == 2) {
    //   setState(() {
    //     itemList2.addAll(fetchDataForPage(++currentPage2));
    //   });
    // }
  }

  List<String> fetchDataForPage(int page) {
    // Simulate fetching data from an API or other source
    return List.generate(10, (index) => 'Item ${index + (page - 1) * 10}');
  }

  Widget buildLoadMoreButton(int listNumber) {
    return ElevatedButton(
      onPressed: () {
        _loadMoreData(listNumber);
      },
      child: const Text('Load More'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dual ListViews with Load More'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.keyboard_arrow_up),
        onPressed: () {
          // Scroll to the top when the button is pressed
          _scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemList1.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(itemList1[index]),
                  // Other list item configurations
                );
              },
            ),
            if (isLoadingList1) const CircularProgressIndicator(),
            buildLoadMoreButton(1),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemList2.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(itemList2[index]),
                  // Other list item configurations
                );
              },
            ),
            if (isLoadingList2) const CircularProgressIndicator(),
            buildLoadMoreButton(2),
          ],
        ),
      ),
    );
  }
}
