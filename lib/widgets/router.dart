import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sorravlstudios/pages/app_details_page.dart';
import 'package:sorravlstudios/pages/careers_page.dart';
import 'package:sorravlstudios/pages/error_page.dart';
import 'package:sorravlstudios/pages/home_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return NoTransitionPage(
            key: state.pageKey,
            child: HomePage(
              path: state.path,
            ));
      },
    ),
    GoRoute(
      path: '/careers',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return NoTransitionPage(
            child: CareersPage(
          path: state.path,
        ));
      },
    ),
    GoRoute(
      path: '/project/:appId',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return NoTransitionPage(
            child: AppDetailsPage(
          appId: state.pathParameters['appId']!,
        ));
      },
    ),
  ],
  errorPageBuilder: (context, state) {
    return NoTransitionPage(child: ErrorPage(path: state.matchedLocation));
  },
);
