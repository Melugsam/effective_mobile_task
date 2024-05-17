import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'search_info_event.dart';
part 'search_info_state.dart';

class SearchInfoBloc extends Bloc<SearchInfoEvent, SearchInfoState> {
  TextEditingController fromTextEditingController = TextEditingController();
  TextEditingController? toTextEditingController;
  String? date;
  SearchInfoBloc() : super(SearchInfoInitial()) {
    on<UpdateFromTextEvent>((event, emit) {
      fromTextEditingController=event.fromTextEditingController;
    });
    on<UpdateToTextEvent>((event, emit) {
      toTextEditingController=event.toTextEditingController;
    });
    on<UpdateDateInfoEvent>((event, emit) {
      date=event.date;
    });
  }
}
