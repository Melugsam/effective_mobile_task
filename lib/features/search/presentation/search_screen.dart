import 'package:effective_mobile_task/features/menu/domain/model/search_route_params.dart';
import 'package:effective_mobile_task/features/search/domain/bloc/search_info/search_info_bloc.dart';
import 'package:effective_mobile_task/features/search/presentation/widgets/core/custom_search_bar_widget.dart';
import 'package:effective_mobile_task/features/search/presentation/widgets/core/filter_list_widget.dart';
import 'package:effective_mobile_task/features/search/presentation/widgets/core/show_tickets_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/core/direct_flights_widget.dart';

class SearchScreen extends StatefulWidget {
  final SearchRouteParams searchRouteParams;

  const SearchScreen({super.key, required this.searchRouteParams});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    final searchInfoBloc = context.read<SearchInfoBloc>();
    searchInfoBloc.fromTextEditingController=widget.searchRouteParams.fromTextEditingController;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(12, 12, 12, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchBarWidget(),
              const FilterListWidget(),
              const DirectFlightsWidget(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 23, horizontal: 16),
                child: ShowTicketsButtonWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
