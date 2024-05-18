import 'package:effective_mobile_task/features/tickets/domain/model/tickets_route_params.dart';
import 'package:effective_mobile_task/features/tickets/presentation/widgets/core/bottom_buttons_widget.dart';
import 'package:effective_mobile_task/features/tickets/presentation/widgets/core/tickets_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../search/domain/bloc/search_info/search_info_bloc.dart';
import '../domain/bloc/tickets_info/tickets_info_bloc.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({super.key});

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  @override
  void initState() {
    BlocProvider.of<TicketsInfoBloc>(context).add(FetchTicketsInfoEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final searchInfoBloc = context.read<SearchInfoBloc>();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(12, 12, 12, 1),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(8),
                    color: const Color.fromRGBO(36, 37, 41, 1),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => context.go("/search"),
                          child: SvgPicture.asset(
                            'assets/svg/tickets_left_arrow.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        const SizedBox(width: 8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${searchInfoBloc.fromTextEditingController.text}-${searchInfoBloc.toTextEditingController.text}",
                              style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 4,),
                            Text(
                              "${translateDate(searchInfoBloc.date.toString())}, 1 пассажир",
                              style: const TextStyle(
                                color: Color.fromRGBO(159,159,159,1),
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                fontSize: 14,
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                  const TicketsListViewWidget(),
                ],
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BottomButtonsWidget(),
                  ],
                ),
                SizedBox(height: 16,)
              ],
            ),
          ],
        ),
      ),
    );
  }
  String translateDate(String text) {
    final Map<String, String> monthTranslations = {
      'Jan': 'января',
      'Feb': 'февраля',
      'Mar': 'марта',
      'Apr': 'апреля',
      'May': 'мая',
      'Jun': 'июня',
      'Jul': 'июля',
      'Aug': 'августа',
      'Sep': 'сентября',
      'Oct': 'октября',
      'Nov': 'ноября',
      'Dec': 'декабря',
    };

    List<String> parts = text.split(', ');
    List<String> dateParts = parts[0].split(' ');

    String day = dateParts[0];
    String month = monthTranslations[dateParts[1]] ?? dateParts[1];

    return '$day $month';
  }
}
