import 'package:effective_mobile_task/features/search/presentation/widgets/core/custom_search_bar_widget.dart';
import 'package:effective_mobile_task/features/search/presentation/widgets/core/filter_list_widget.dart';
import 'package:effective_mobile_task/features/search/presentation/widgets/core/price_subscription_widget.dart';
import 'package:effective_mobile_task/features/search/presentation/widgets/core/show_tickets_button_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/core/direct_flights_widget.dart';

class SearchScreen extends StatefulWidget {

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(12, 12, 12, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchBarWidget(),
              FilterListWidget(),
              DirectFlightsWidget(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 23, horizontal: 16),
                child: ShowTicketsButtonWidget(),
              ),
              PriceSubscriptionWidget()
            ],
          ),
        ),
      ),
    );
  }
}
