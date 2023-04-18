// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/components/components.dart';

// * Build Appbar
AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1,
        // height defines he thickness of the line
      ),
    ),
    title: Text(
      'Log In',
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

// * Build Third Party Login
// Need context for accessing bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons(() {
          print('Press Google Icon');
        }, 'google'),
        _reusableIcons(() {
          print('Press Apple Icon');
        }, 'apple'),
        _reusableIcons(() {
          print('Press Facebook Icon');
        }, 'facebook'),
      ],
    ),
  );
}

// * Reusable Text
Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(.5),
        fontSize: 14.sp,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

// * Reusable Icon
Widget _reusableIcons(Function() onTap, String iconName) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

// * Text - Forgot Password
Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(left: 185.h),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        'Forgot password ?',
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          fontFamily: 'Avenir',
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
        ),
      ),
    ),
  );
}

// * Build Login & Register Button
// Widget buildLogInAndRegButton(String buttonName) {
//   return GestureDetector(
//     onTap: () {},
//     child: Center(
//       child: Container(
//         width: 325.w,
//         height: 50.h,
//         margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h),
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.circular(15.w),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(.1),
//               offset: const Offset(0, 1),
//               blurRadius: 2,
//               spreadRadius: 1,
//             ),
//           ],
//         ),
//         child: Center(child: Text(buttonName)),
//       ),
//     ),
//   );
// }
