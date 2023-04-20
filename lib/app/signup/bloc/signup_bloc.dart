// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<UsernameEvent>(_usernameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_repasswordEvent);
    // on<SignUpEvent>((event, emit) {});
  }

  void _usernameEvent(UsernameEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(username: event.username));
    print('My username is ${event.username}');
  }

  void _emailEvent(EmailEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(email: event.email));
    print('My email is ${event.email}');
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(password: event.password));
    print('My password is ${event.password}');
  }

  void _repasswordEvent(RePasswordEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(repassword: event.repassword));
    print('My repassword is ${event.repassword}');
  }
}
