// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../signin.dart';
import '/common/common.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  // * Handle Email SignIn
  Future<void> handleEmailSignIn(String type) async {
    try {
      if (type == 'email') {
        // BlocProvider.of<SigninBloc>(context).state
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          print('You need to fill email address - (handleEmailSignIn)');
          toastInfo(msg: 'You need to fill email address');
          return;
        }
        if (password.isEmpty) {
          print('You need to fill password - (handleEmailSignIn)');
          toastInfo(msg: 'You need to fill password');
          return;
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential.user == null) {
            print('User does not exist - (handleEmailSignIn)');
            toastInfo(msg: 'You don\'t exist');
            return;
          }
          if (!credential.user!.emailVerified) {
            print(
                'You need to verify your email account - (handleEmailSignIn)');
            toastInfo(msg: 'You need to verify your email account');
            return;
          }

          var user = credential.user;
          if (user != null) {
            print('User exist - move to home page - (handleEmailSignIn)');
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/homePage', (route) => false);
            // Verified user from firebase
          } else {
            print(
                'Currently you\'re not a user of this app - (handleEmailSignIn)');
            toastInfo(msg: 'Currently you\'re not a user of this app');
            return;
            // Error gettting user from firebase
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email');
            toastInfo(msg: 'No user found for that email');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user');
            toastInfo(msg: 'Wrong password provided for that user');
          } else if (e.code == 'invalid-email') {
            print('Your email format is wrong');
            toastInfo(msg: 'Your email format is wrong');
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
