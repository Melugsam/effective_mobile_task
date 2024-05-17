import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/api/model/search_flights_get_model.dart';
import '../../../domain/bloc/search_flights_bloc.dart';

class DirectFlightsWidget extends StatefulWidget {
  const DirectFlightsWidget({super.key});

  @override
  State<DirectFlightsWidget> createState() => _DirectFlightsWidgetState();
}

class _DirectFlightsWidgetState extends State<DirectFlightsWidget> {
  @override
  void initState() {
    BlocProvider.of<SearchFlightsBloc>(context).add(FetchSearchFlights());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(29, 30, 32, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Прямые рельсы",
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
            ),
          ),
          BlocBuilder<SearchFlightsBloc, SearchFlightsState>(
            builder: (context, state) {
              if (state is SearchFlightsLoadingState) {
                return const Center(
                    child: CircularProgressIndicator(color: Colors.white));
              } else if (state is SearchFlightsLoadedState) {
                final SearchFlightsGetModel searchFlightsGetModel =
                    state.ticketsOffers;
                return ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  scrollDirection: Axis.vertical,
                  itemCount: searchFlightsGetModel.tickets_offers.length,
                  itemBuilder: (context, index) {
                    final offer = searchFlightsGetModel.tickets_offers[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color.fromRGBO(62, 63, 67, 1),
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: getTitleColor(offer.id),
                          ),
                          const SizedBox(width: 8,),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      offer.title,
                                      style: const TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 14,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${offer.price.value.toString()} ₽",
                                          style: const TextStyle(
                                            color: Color.fromRGBO(34, 97, 188, 1),
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          'assets/svg/search_right_blue_arrow.svg',
                                          width: 16,
                                          height: 16,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    offer.time_range.join("  "),
                                    style: const TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              } else if (state is SearchFlightsErrorState) {
                return Text(
                  'Ошибка: ${state.errorMessage}',
                  style: const TextStyle(fontSize: 22),
                );
              } else {
                return const Text('Неизвестное состояние');
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Показать все",
              style: TextStyle(
                color: Color.fromRGBO(34, 97, 188, 1),
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getTitleColor(int title) {
    switch (title) {
      case 1:
        return Colors.red;
      case 10:
        return Colors.blue;
      case 30:
        return Colors.white;
      default:
        return Colors.black;
    }
  }
}
