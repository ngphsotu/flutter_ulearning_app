import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/home/home.dart';
import 'app/signin/signin.dart';
import 'app/signup/signup.dart';
import 'app/welcome/welcome.dart';
import 'common/common.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter U-learning App',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(color: AppColors.primaryText),
              backgroundColor: AppColors.primaryBackground,
            ),
          ),
          home: const WelcomePage(),
          routes: {
            // 'homePage': (context) => const HomePage(),
            'signIn': (context) => const SignInPage(),
            'signUp': (context) => const SignUpPage(),
          },
        ),
      ),
    );
  }
}
