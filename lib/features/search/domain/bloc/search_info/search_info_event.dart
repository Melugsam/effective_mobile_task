part of 'search_info_bloc.dart';

sealed class SearchInfoEvent {}

class UpdateFromTextEvent extends SearchInfoEvent {
  final String fromTextEditingControllerText;

  UpdateFromTextEvent(this.fromTextEditingControllerText);
}

class UpdateToTextEvent extends SearchInfoEvent {
  final String toTextEditingControllerText;

  UpdateToTextEvent(this.toTextEditingControllerText);
}

class UpdateDateInfoEvent extends SearchInfoEvent {
  final String date;

  UpdateDateInfoEvent(this.date);
}