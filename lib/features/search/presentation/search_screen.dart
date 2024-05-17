import 'package:effective_mobile_task/features/menu/domain/model/search_route_params.dart';
import 'package:effective_mobile_task/features/search/presentation/widgets/core/custom_search_bar_widget.dart';
import 'package:effective_mobile_task/features/search/presentation/widgets/core/filter_list_widget.dart';
import 'package:effective_mobile_task/features/search/presentation/widgets/core/show_tickets_button_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/core/direct_flights_widget.dart';

class SearchScreen extends StatefulWidget {
  final SearchRouteParams searchRouteParams;

  const SearchScreen({super.key, required this.searchRouteParams});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController fromTextEditingController;
  late TextEditingController toTextEditingController;

  @override
  void initState() {
    fromTextEditingController = TextEditingController(
        text: widget.searchRouteParams.fromTextEditingController.text);
    toTextEditingController = TextEditingController(
        text: widget.searchRouteParams.toTextEditingController.text);
    super.initState();
  }

  @override
  void dispose() {
    fromTextEditingController.dispose();
    toTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(12, 12, 12, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchBarWidget(
                fromTextEditingController: fromTextEditingController,
                toTextEditingController: toTextEditingController,
              ),
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
