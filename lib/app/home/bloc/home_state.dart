part of 'home_bloc.dart';

class HomeState {
  final int index;

  const HomeState({this.index = 0});
}

class HomeInitial extends HomeState {
  HomeInitial({required super.index});
}
