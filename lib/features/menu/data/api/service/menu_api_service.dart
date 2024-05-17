import 'package:effective_mobile_task/features/menu/data/api/model/menu_get_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'menu_api_service.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class MenuApiService{
  factory MenuApiService(Dio dio) = _MenuApiService;

  @GET("214a1713-bac0-4853-907c-a1dfc3cd05fd")
  Future<MenuGetModel> getOffers();
}