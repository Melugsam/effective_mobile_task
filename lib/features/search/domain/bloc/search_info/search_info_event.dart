part of 'search_info_bloc.dart';

sealed class SearchInfoEvent {}

class UpdateFromTextEvent extends SearchInfoEvent {
  final TextEditingController fromTextEditingController;

  UpdateFromTextEvent(this.fromTextEditingController);
}

class UpdateToTextEvent extends SearchInfoEvent {
  final TextEditingController toTextEditingController;

  UpdateToTextEvent(this.toTextEditingController);
}

class UpdateDateInfoEvent extends SearchInfoEvent {
  final String date;

  UpdateDateInfoEvent(this.date);
}