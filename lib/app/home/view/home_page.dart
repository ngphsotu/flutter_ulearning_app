// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home.dart';
import '/common/common.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          color: AppColors.primaryBackground,
          child: SafeArea(
            child: Scaffold(
              body: buildHomePage(state.index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.1),
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,
                  currentIndex: state.index,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourthElementText,
                  onTap: (value) {
                    context
                        .read<HomeBloc>()
                        .add(TriggerHomeEvent(index: value));
                  },
                  items: [
                    BottomNavigationBarItem(
                      label: 'home',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/home.png'),
                      ),
                      activeIcon: SizedBox(
                        child: Image.asset(
                          'assets/icons/home.png',
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'search',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/search2.png'),
                      ),
                      activeIcon: SizedBox(
                        child: Image.asset(
                          'assets/icons/search2.png',
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'course',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/play-circle1.png'),
                      ),
                      activeIcon: SizedBox(
                        child: Image.asset(
                          'assets/icons/play-circle1.png',
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'chat',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/message-circle.png'),
                      ),
                      activeIcon: SizedBox(
                        child: Image.asset(
                          'assets/icons/message-circle.png',
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'profile',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/person2.png'),
                      ),
                      activeIcon: SizedBox(
                        child: Image.asset(
                          'assets/icons/person2.png',
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
