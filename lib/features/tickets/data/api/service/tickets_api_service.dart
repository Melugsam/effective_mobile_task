import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../model/tickets_get_model.dart';

part 'tickets_api_service.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class TicketsApiService {
  factory TicketsApiService(Dio dio) = _TicketsApiService;

  @GET("670c3d56-7f03-4237-9e34-d437a9e56ebf")
  Future<TicketsGetModel> getTickets();
}
