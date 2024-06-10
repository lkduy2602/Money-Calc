import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_calc/app.navigation_bar.dart';
import 'package:money_calc/calculator/calculator.screen.dart';
import 'package:money_calc/explore/explore.screen.dart';
import 'package:money_calc/settings/settings.screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/calculator',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Scaffold(body: SafeArea(child: navigationShell), bottomNavigationBar: AppNavigationBar(navigationShell));
      },
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/calculator',
            builder: (context, state) => const CalculatorScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/calculator',
            builder: (context, state) => const CalculatorScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/calculator',
            builder: (context, state) => const CalculatorScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: '/explore', builder: (context, state) => const ExploreScreen(), routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsScreen(),
            ),
          ]),
        ]),
      ],
    ),
  ],
);
