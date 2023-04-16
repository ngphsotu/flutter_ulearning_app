// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/app/welcome/welcome.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: _controller,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                      print('Index value is $index');
                    },
                    children: [
                      _page(
                        1,
                        context,
                        'First see learning',
                        'Forget about a for of paper all knowledge in one learning!',
                        'imagePath',
                        'Next',
                      ),
                      _page(
                        2,
                        context,
                        'Connect With Everyone',
                        'Always keep in touch with your tutor & friend. Let\'s get connected!',
                        'imagePath',
                        'Next',
                      ),
                      _page(
                        3,
                        context,
                        'Always Fascinated Learning',
                        'Anywhere, anytime. The time is at your discretion so study whenever you want.',
                        'imagePath',
                        'Get Started',
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 100.h,
                    child: DotsIndicator(
                      position: state.page.toDouble(),
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        size: const Size.square(8),
                        activeSize: const Size(18, 8),
                        activeColor: Colors.blue,
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Column _page(
    int index,
    BuildContext context,
    String title,
    String subTitle,
    String imagePath,
    String buttonName,
  ) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: const Text('Image one'),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
              color: Colors.black.withOpacity(.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 100.h,
            left: 25.w,
            right: 25.w,
          ),
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(15.w)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.1),
                offset: const Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
