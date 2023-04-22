part of 'signup_bloc.dart';

abstract class SignUpEvent {
  const SignUpEvent();
}

class UsernameEvent extends SignUpEvent {
  final String username;

  const UsernameEvent({required this.username});
}

class EmailEvent extends SignUpEvent {
  final String email;

  const EmailEvent({required this.email});
}

class PasswordEvent extends SignUpEvent {
  final String password;

  const PasswordEvent({required this.password});
}

class RePasswordEvent extends SignUpEvent {
  final String repassword;

  const RePasswordEvent({required this.repassword});
}
