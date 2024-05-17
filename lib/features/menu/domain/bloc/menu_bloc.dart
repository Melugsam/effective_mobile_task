import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:effective_mobile_task/features/menu/data/api/model/menu_get_model.dart';
import 'package:effective_mobile_task/features/menu/data/api/service/menu_api_service.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitialState()) {
    final MenuApiService apiService = MenuApiService(Dio(BaseOptions(contentType: "application/json")));
    on<FetchMenuEvent>((event, emit) async {
      emit(MenuLoadingState());
      try {
        final MenuGetModel offers = await apiService.getOffers();
        emit(MenuLoadedState(offers: offers));
      } catch (e) {
        emit(MenuErrorState(errorMessage: e.toString()));
      }
    });
  }
}
