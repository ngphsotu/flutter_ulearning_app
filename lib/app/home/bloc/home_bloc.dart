// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    // on<HomeEvent>((event, emit) {});
    on<TriggerHomeEvent>((event, emit) {
      emit(HomeState(index: state.index));
      print('My tapped index is ${event.index}');
    });
  }
}
