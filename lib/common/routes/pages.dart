// ignore_for_file: avoid_print

import '/lib.dart';
import '/common/common.dart';
import '/app/home/home.dart';
import '/app/signup/signup.dart';
import '/app/signin/signin.dart';
import '/app/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.appINITIAL,
        page: const WelcomePage(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.appSIGNIN,
        page: const SignInPage(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.appSIGNUP,
        page: const SignUpPage(),
        bloc: BlocProvider(create: (_) => SignUpBloc()),
      ),
      PageEntity(
        route: AppRoutes.appHOME,
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
        print('Valid route name ${settings.name}');
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
