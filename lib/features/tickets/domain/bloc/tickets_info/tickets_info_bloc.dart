import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../data/api/model/tickets_get_model.dart';
import '../../../data/api/service/tickets_api_service.dart';

part 'tickets_info_event.dart';
part 'tickets_info_state.dart';

class TicketsInfoBloc extends Bloc<TicketsInfoEvent, TicketsInfoState> {
  TicketsInfoBloc() : super(TicketsInfoInitialState()) {
    final TicketsApiService apiService = TicketsApiService(Dio(BaseOptions(contentType: "application/json")));
    on<FetchTicketsInfoEvent>((event, emit) async {
      emit(TicketsInfoLoadingState());
      try {
        final TicketsGetModel tickets = await apiService.getTickets();
        emit(TicketsInfoLoadedState(tickets: tickets));
      } catch (e) {
        emit(TicketsInfoErrorState(errorMessage: e.toString()));
      }
    });
  }
}
