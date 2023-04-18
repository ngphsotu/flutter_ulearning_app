// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../signin.dart';
import '/components/components.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.primaryBackground,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                Center(
                  child: reusableText('Or use your email account to login'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ReusableTextFormField(
                        hintText: 'Enter your email',
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.person),
                        autocorrect: false,
                        keyboardType: TextInputType.multiline,
                      ),
                      SizedBox(height: 10.h),
                      const ReusableTextFormField(
                        hintText: 'Enter your password',
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.security),
                        autocorrect: false,
                        obscureText: true,
                        keyboardType: TextInputType.multiline,
                      ),
                      SizedBox(height: 10.h),
                      forgotPassword(),
                      Container(
                        width: 325.w,
                        height: 40.h,
                        margin: EdgeInsets.only(
                            left: 75.w, right: 75.w, top: 125.h),
                        child: ReusableButton(
                          buttonName: 'Login',
                          backgroundColor: AppColors.primaryElement,
                          onPressed: () {
                            print('Press Login Button');
                          },
                        ),
                      ),
                      Center(child: reusableText('or')),
                      Container(
                        width: 325.w,
                        height: 40.h,
                        margin: EdgeInsets.only(left: 75.w, right: 75.w),
                        child: ReusableButton(
                          side: const BorderSide(
                            color: AppColors.primaryFourthElementText,
                          ),
                          textColor: AppColors.primaryText,
                          buttonName: 'Register',
                          backgroundColor: AppColors.primaryBackground,
                          onPressed: () {
                            print('Press Register Button');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
