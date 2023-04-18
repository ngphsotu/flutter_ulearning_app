import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ulearning_app/app/signin/bloc/signin_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        // BlocProvider.of<SigninBloc>(context).state
        final state = context.read<SigninBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          //
        }
        if (password.isEmpty) {
          //
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential.user == null) {
            //
          }
          if (!credential.user!.emailVerified) {
            //
          }

          var user = credential.user;
          if (user != null) {
            // Verified user from firebase
          } else {
            // Error gettting user from firebase
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
