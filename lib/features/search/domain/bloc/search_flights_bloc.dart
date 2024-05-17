import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../data/api/model/search_flights_get_model.dart';
import '../../data/api/service/search_flights_api_service.dart';


part 'search_flights_event.dart';
part 'search_flights_state.dart';

class SearchFlightsBloc extends Bloc<SearchFlightsEvent, SearchFlightsState> {
  SearchFlightsBloc() : super(SearchFlightsInitial()) {
    final SearchFlightsApiService apiService = SearchFlightsApiService(Dio(BaseOptions(contentType: "application/json")));
    on<SearchFlightsEvent>((event, emit) async {
      emit(SearchFlightsLoadingState());
      try {
        final SearchFlightsGetModel ticketsOffers = await apiService.getTicketsOffers();
        emit(SearchFlightsLoadedState(ticketsOffers: ticketsOffers));
      } catch (e) {
        emit(SearchFlightsErrorState(errorMessage: e.toString()));
      }
    });
  }
}
