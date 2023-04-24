// ignore_for_file: avoid_print

import '/lib.dart';
import '/global.dart';
import '/common/common.dart';
import '/app/home/home.dart';
import '/app/signup/signup.dart';
import '/app/signin/signin.dart';
import '/app/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const WelcomePage(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGNIN,
        page: const SignInPage(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGNUP,
        page: const SignUpPage(),
        bloc: BlocProvider(create: (_) => SignUpBloc()),
      ),
      PageEntity(
        route: AppRoutes.HOME,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => HomeBloc()),
      ),
    ];
  }

  // Return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // A modal that covers entire screen as we click on navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // Check for route name matching when navigator get triggered.
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        // print('First log: ${result.first.route}');

        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          // print('Second log');

          bool isLoggedin = Global.storageService.getIsLoggedIn();
          if (isLoggedin) {
            return MaterialPageRoute(
                builder: (_) => const HomePage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignInPage(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }

    print('Invalid route name ${settings.name}');
    return MaterialPageRoute(
        builder: (_) => const SignInPage(), settings: settings);
  }
}

//  Unify BlocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}
