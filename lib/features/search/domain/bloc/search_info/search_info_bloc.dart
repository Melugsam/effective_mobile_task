import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'search_info_event.dart';
part 'search_info_state.dart';

class SearchInfoBloc extends Bloc<SearchInfoEvent, SearchInfoState> {
  TextEditingController fromTextEditingController = TextEditingController();
  TextEditingController toTextEditingController = TextEditingController();
  String? date;
  SearchInfoBloc() : super(SearchInfoInitial()) {
    on<UpdateFromTextEvent>((event, emit) {
      fromTextEditingController.text=event.fromTextEditingControllerText;
    });
    on<UpdateToTextEvent>((event, emit) {
      toTextEditingController.text=event.toTextEditingControllerText;
    });
    on<UpdateDateInfoEvent>((event, emit) {
      date=event.date;
    });
  }
}
