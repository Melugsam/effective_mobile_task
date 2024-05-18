part of 'tickets_info_bloc.dart';

abstract class TicketsInfoState {}

class TicketsInfoInitialState extends TicketsInfoState {}

class TicketsInfoLoadingState extends TicketsInfoState {}

class TicketsInfoLoadedState extends TicketsInfoState {
  final TicketsGetModel tickets;

  TicketsInfoLoadedState({required this.tickets});
}

class TicketsInfoErrorState extends TicketsInfoState {
  final String errorMessage;

  TicketsInfoErrorState({required this.errorMessage});
}