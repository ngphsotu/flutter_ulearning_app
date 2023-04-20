// ignore_for_file: avoid_print

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
          //
          print('You need to fill email address');
          toastInfo(msg: 'You need to fill email address');
          return;
        }
        // else {
        //   print('Email is $emailAddress');
        //   toastInfo(msg: 'Email is $emailAddress');
        // }
        if (password.isEmpty) {
          //
          print('You need to fill password');
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
            //
            print('User does not exist');
            toastInfo(msg: 'You don\'t exist');
            return;
          }
          if (!credential.user!.emailVerified) {
            //
            print('You need to verify your email account');
            toastInfo(msg: 'You need to verify your email account');
            return;
          }

          var user = credential.user;
          if (user != null) {
            // Verified user from firebase
            print('User exist');
          } else {
            // Error gettting user from firebase
            print('Currently you\'re not a user of this app');
            toastInfo(msg: 'Currently you\'re not a user of this app');
            return;
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
