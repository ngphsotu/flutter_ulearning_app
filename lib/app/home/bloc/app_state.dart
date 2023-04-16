part of 'app_bloc.dart';

class AppState {
  int counter;

  AppState({required this.counter});
}

class IniStates extends AppState {
  IniStates() : super(counter: 0);
}
