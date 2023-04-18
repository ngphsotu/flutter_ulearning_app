// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../welcome.dart';
import '/components/components.dart';

PageController pageController = PageController(initialPage: 0);

// * Build Page
Column buildPage(
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
        child: Image.asset(imagePath, fit: BoxFit.fill),
      ),
      Text(
        title,
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 24.sp,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.normal,
        ),
      ),
      Container(
        width: 375.w,
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: Text(
          subTitle,
          style: TextStyle(
            color: AppColors.primarySecondaryElementText,
            fontSize: 14.sp,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      Container(
        width: 325.w,
        height: 40.h,
        margin: EdgeInsets.only(left: 100.w, right: 100.w, top: 120.h),
        child: ReusableButton(
          backgroundColor: AppColors.primaryElement,
          buttonName: 'Next',
          onPressed: () {
            print('Press Next Button');
            // within 0-2 index
            if (index < 3) {
              // animation
              pageController.animateToPage(
                index,
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 500),
              );
            } else {
              // jump to a new page
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //         builder: (context) => const HomePage(title: 'Home')),
              //  );
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('SignIn', (route) => false);
            }
          },
        ),
      ),
    ],
  );
}

// * Build Dots
DotsIndicator buildDots(WelcomeState state) {
  return DotsIndicator(
    position: state.page.toDouble(),
    dotsCount: 3,
    mainAxisAlignment: MainAxisAlignment.center,
    decorator: DotsDecorator(
      color: AppColors.primaryThirdElementText,
      size: const Size.square(8),
      activeSize: const Size(18, 8),
      activeColor: AppColors.primaryElement,
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}

// SmoothPageIndicator buildSmoothPageIndicator(WelcomeState state) {
//   return SmoothPageIndicator(
//     controller: pageController,
//     count: state.page,
//     effect: const WormEffect(
//       dotHeight: 16,
//       dotWidth: 16,
//       type: WormType.thinUnderground,
//     ),
//   );
// }
