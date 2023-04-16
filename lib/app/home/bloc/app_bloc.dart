// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(IniStates()) {
    on<Increment>((event, ask) {
      ask(AppState(counter: state.counter + 1));
      print(state.counter);
    });

    on<Decrement>((event, ask) {
      ask(AppState(counter: state.counter - 1));
      print(state.counter);
    });
  }
}
