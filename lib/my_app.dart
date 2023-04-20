import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/common.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          title: 'Flutter U-learning App',
          onGenerateRoute: AppPages.generateRouteSettings,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(color: AppColors.primaryText),
              backgroundColor: AppColors.primaryBackground,
            ),
          ),
        ),
      ),
    );
  }
}
