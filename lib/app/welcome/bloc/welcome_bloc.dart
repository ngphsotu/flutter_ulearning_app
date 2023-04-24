// ignore_for_file: avoid_print

import '/lib.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeInitial()) {
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
      print('Page: ${state.page}');
    });
  }
}
