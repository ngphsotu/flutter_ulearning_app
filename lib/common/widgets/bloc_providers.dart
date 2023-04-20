import 'package:flutter_bloc/flutter_bloc.dart';

import '/app/signin/signin.dart';
import '/app/signup/signup.dart';
import '/app/welcome/welcome.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
        // BlocProvider(lazy: false, create: (context) => AppBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => SignUpBloc()),
      ];
}
