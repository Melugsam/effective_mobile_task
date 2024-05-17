part of 'search_flights_bloc.dart';

abstract class SearchFlightsState {}

class SearchFlightsInitial extends SearchFlightsState {}

class SearchFlightsLoadingState extends SearchFlightsState {}

class SearchFlightsLoadedState extends SearchFlightsState {
  final SearchFlightsGetModel ticketsOffers;

  SearchFlightsLoadedState({required this.ticketsOffers});
}
class SearchFlightsErrorState extends SearchFlightsState {
  final String errorMessage;

  SearchFlightsErrorState({required this.errorMessage});
}



