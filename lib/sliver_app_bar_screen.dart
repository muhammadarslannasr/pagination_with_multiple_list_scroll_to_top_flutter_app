import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SliverAppBarScreen extends StatefulWidget {
  const SliverAppBarScreen({super.key});

  @override
  State<SliverAppBarScreen> createState() => _SliverAppBarScreenState();
}

class _SliverAppBarScreenState extends State<SliverAppBarScreen> {
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 2.h,
            scrolledUnderElevation: 0.0,
            elevation: 0,
            pinned: true,
            floating: true,
            collapsedHeight: 5.h,
            expandedHeight: 8.h,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              top = constraints.biggest.height;
              print(top.toString());
              print('Height: ${10.h}');
              return FlexibleSpaceBar(
                centerTitle: top > 12.h ? false : true,
                titlePadding: EdgeInsets.only(left: 16, bottom: 10),
                title: Text(
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
