import 'package:effective_mobile_task/features/menu/data/api/model/menu_get_model.dart';
import 'package:effective_mobile_task/features/search/data/api/model/search_flights_get_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'search_flights_api_service.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class SearchFlightsApiService{
  factory SearchFlightsApiService(Dio dio) = _SearchFlightsApiService;

  @GET("7e55bf02-89ff-4847-9eb7-7d83ef884017")
  Future<SearchFlightsGetModel> getTicketsOffers();
}