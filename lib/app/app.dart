import 'package:effective_mobile_task/features/menu/domain/bloc/menu_bloc.dart';
import 'package:effective_mobile_task/features/search/domain/bloc/search_info/search_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:effective_mobile_task/app/routes.dart';

import '../features/search/domain/bloc/search_flights/search_flights_bloc.dart';
import '../features/tickets/domain/bloc/tickets_info/tickets_info_bloc.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MenuBloc(),
        ),
        BlocProvider(
          create: (context) => SearchFlightsBloc(),
        ),
        BlocProvider(
          create: (context) => SearchInfoBloc(),
        ),
        BlocProvider(
          create: (context) => TicketsInfoBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: route.routerDelegate,
        routeInformationParser: route.routeInformationParser,
        routeInformationProvider: route.routeInformationProvider,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: "SF-Pro-Display",
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
