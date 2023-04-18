import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/home/home.dart';
import 'app/signin/signin.dart';
import 'app/welcome/welcome.dart';
import 'components/components.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
        BlocProvider(lazy: false, create: (context) => AppBloc()),
        BlocProvider(create: (context) => SignInBloc()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter U-learning App',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: AppColors.primaryBackground,
            ),
          ),
          home: const WelcomePage(),
          routes: {
            'HomePage': (context) => const HomePage(),
            'SignIn': (context) => const SignInPage(),
          },
        ),
      ),
    );
  }
}
