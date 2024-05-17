import 'package:effective_mobile_task/features/menu/domain/model/search_route_params.dart';
import 'package:effective_mobile_task/features/menu/presentation/menu_screen.dart';
import 'package:effective_mobile_task/features/search/presentation/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/tickets/domain/model/tickets_route_params.dart';
import '../features/tickets/presentation/widgets/tickets_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter route = GoRouter(navigatorKey: _rootNavigatorKey, routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const MenuScreen(),
  ),
  GoRoute(
      path: '/search',
      builder: (context, state) {
        SearchRouteParams searchRouteParams = state.extra as SearchRouteParams;
        return SearchScreen(searchRouteParams: searchRouteParams);
      }),
  GoRoute(
      path: '/tickets',
      builder: (context, state) {
        TicketsRouteParams ticketsRouteParams = state.extra as TicketsRouteParams;
        return TicketsScreen(ticketsRouteParams: ticketsRouteParams);
      }),
]);
