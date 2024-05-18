import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/api/model/menu_get_model.dart';
import '../../../domain/bloc/menu_bloc.dart';

class CitiesListWidget extends StatelessWidget {
  const CitiesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          if (state is MenuLoadingState) {
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          } else if (state is MenuLoadedState) {
            final MenuGetModel menuGetModel = state.offers;
            return SizedBox(
              height: 300,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: menuGetModel.offers.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 67,);
                },
                itemBuilder: (context, index) {
                  final offer = menuGetModel.offers[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/${offer.id}.png',
                        width: 132,
                        height: 132,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        offer.title,
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        offer.town,
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/menu_plane.svg',
                            width: 24,
                            height: 24,
                          ),
                          Text(
                            "от ${offer.price.value.toString()} ₽",
                            style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            );
          } else if (state is MenuErrorState) {
            return Text('Ошибка: ${state.errorMessage}');
          } else {
            return const Text('Неизвестное состояние');
          }
        },
      ),
    );
  }
}

