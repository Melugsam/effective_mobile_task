import 'package:effective_mobile_task/features/menu/presentation/menu_screen.dart';
import 'package:effective_mobile_task/features/navigation/presentation/widgets/navigation_screen.dart';
import 'package:effective_mobile_task/features/search/presentation/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/tickets/presentation/tickets_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter route = GoRouter(navigatorKey: _rootNavigatorKey, routes: [
  GoRoute(
    path: '/',
    builder: (context, state) =>
        const NavigationScreen(navigationScreen: MenuScreen()),
  ),
  GoRoute(
    path: '/search',
    builder: (context, state) => const NavigationScreen(
      navigationScreen: SearchScreen(),
    ),
  ),
  GoRoute(
    path: '/tickets',
    builder: (context, state) => const NavigationScreen(
      navigationScreen: TicketsScreen(),
    ),
  )
]);
