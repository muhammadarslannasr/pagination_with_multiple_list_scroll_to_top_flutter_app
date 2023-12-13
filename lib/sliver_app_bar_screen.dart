import 'package:flutter/material.dart';

class SliverAppBarScreen extends StatefulWidget {
  const SliverAppBarScreen({super.key});

  @override
  State<SliverAppBarScreen> createState() => _SliverAppBarScreenState();
}

class _SliverAppBarScreenState extends State<SliverAppBarScreen> {
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            toolbarHeight: 25,
            elevation: 0,
            pinned: true,
            floating: true,
            collapsedHeight: 40,
            expandedHeight: 60,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              top = constraints.biggest.height;
              return FlexibleSpaceBar(
                centerTitle: top > 85 ? false : true,
                titlePadding: const EdgeInsets.only(left: 16, bottom: 10),
                title: const Text(
                  "Flutter Title",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                background: Container(
                  color: Colors.white,
                ),
              );
            }),
          ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: 1000,
          //     color: Colors.blue,
          //     child: Center(child: Text("Gridview")),
          //   ),
          // ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
