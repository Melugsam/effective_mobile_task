part of 'menu_bloc.dart';

abstract class MenuState {}

class MenuInitialState extends MenuState {}

class MenuLoadingState extends MenuState {}

class MenuLoadedState extends MenuState {
  final MenuGetModel offers;

  MenuLoadedState({required this.offers});
}

class MenuErrorState extends MenuState {
  final String errorMessage;

  MenuErrorState({required this.errorMessage});
}


