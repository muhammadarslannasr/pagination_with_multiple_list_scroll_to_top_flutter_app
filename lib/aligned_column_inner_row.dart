import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AlignedColumnInnerRow extends StatelessWidget {
  const AlignedColumnInnerRow({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDluY4_FkwZPxwnbN3P6bQeUyhRSvW3gXZ-1wnupEjLg&s',
              width: 10.w,
              height: 10.w,
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              child: Text(
                'This is the text title we are testing it for alignment and its full length to new line',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              // width: size.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Pickle',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDluY4_FkwZPxwnbN3P6bQeUyhRSvW3gXZ-1wnupEjLg&s',
                    width: 5.w,
                    height: 5.w,
                  ),
                ],
              ),
            ),
            Container(
              // width: size.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: size.width * 0.78,
                    child: CustomHorizontalChart(
                      filledPercentage: 45,
                      startColor: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '34.4 %',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '6,845 명',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomHorizontalChart extends StatelessWidget {
  final double filledPercentage;
  final Color? startColor;

  const CustomHorizontalChart({
    super.key,
    required this.filledPercentage,
    this.startColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 2.h,
          width: 200.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blueAccent.withOpacity(0.1),
          ),
        ),
        Container(
          height: 2.h,
          width: filledPercentage.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent, // Filled color
                Colors.blueAccent.withOpacity(0.2), // Remaining color
              ],
              // stops: [33 / 100, 35 / 100],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
