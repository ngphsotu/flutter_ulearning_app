// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ulearning_app/common/common.dart';

import '../signup.dart';

class SignUpController {
  final BuildContext context;

  const SignUpController({required this.context});

  // * Handle Email SignUp
  Future<void> handleEmailSignUp() async {
    final state = context.read<SignUpBloc>().state;

    String username = state.username;
    String email = state.email;
    String password = state.password;
    String repassword = state.repassword;

    if (username.isEmpty) {
      print('Username can not be empty');
      toastInfo(msg: 'Username can not be empty');
      return;
    }

    if (email.isEmpty) {
      print('Email can not be empty');
      toastInfo(msg: 'Email can not be empty');
      return;
    }

    if (password.isEmpty) {
      print('Password can not be empty');
      toastInfo(msg: 'Password can not be empty');
      return;
    }

    if (repassword.isEmpty) {
      print('Your password confirmation is wrong');
      toastInfo(msg: 'Your password confirmation is wrong');
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        toastInfo(
            msg:
                'An email has been sent to your registered email. To active it, please check your email box and click on the link');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: 'The password provided is too weak');
        print('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'The email is already in use');
        print('The email is already in use');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: 'Your email id is invalid');
        print('The password provided is too weak');
      }
    }
  }

  // Future<void> handleSignUp(String type) async {
  //   try {
  //     if (type == 'email') {
  //       // BlocProvider.of<SigninBloc>(context).state
  //       final state = context.read<SignUpBloc>().state;
  //       String emailAddress = state.email;
  //       String password = state.password;

  //       if (emailAddress.isEmpty) {
  //         //
  //         print('You need to fill email address');
  //         toastInfo(msg: 'You need to fill email address');
  //         return;
  //       }
  //       // else {
  //       //   print('Email is $emailAddress');
  //       //   toastInfo(msg: 'Email is $emailAddress');
  //       // }
  //       if (password.isEmpty) {
  //         //
  //         print('You need to fill password');
  //         toastInfo(msg: 'You need to fill password');
  //         return;
  //       }
  //       try {
  //         final credential =
  //             await FirebaseAuth.instance.signInWithEmailAndPassword(
  //           email: emailAddress,
  //           password: password,
  //         );
  //         if (credential.user == null) {
  //           //
  //           print('User does not exist');
  //           toastInfo(msg: 'You don\'t exist');
  //           return;
  //         }
  //         if (!credential.user!.emailVerified) {
  //           //
  //           print('You need to verify your email account');
  //           toastInfo(msg: 'You need to verify your email account');
  //           return;
  //         }

  //         var user = credential.user;
  //         if (user != null) {
  //           // Verified user from firebase
  //           print('User exist');
  //         } else {
  //           // Error gettting user from firebase
  //           print('Currently you\'re not a user of this app');
  //           toastInfo(msg: 'Currently you\'re not a user of this app');
  //           return;
  //         }
  //       } on FirebaseAuthException catch (e) {
  //         if (e.code == 'user-not-found') {
  //           print('No user found for that email');
  //           toastInfo(msg: 'No user found for that email');
  //         } else if (e.code == 'wrong-password') {
  //           print('Wrong password provided for that user');
  //           toastInfo(msg: 'Wrong password provided for that user');
  //         } else if (e.code == 'invalid-email') {
  //           print('Your email format is wrong');
  //           toastInfo(msg: 'Your email format is wrong');
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
