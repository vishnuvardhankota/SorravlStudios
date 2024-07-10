import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sorravlstudios/pages/app_details_page.dart';
import 'package:sorravlstudios/pages/careers_page.dart';
import 'package:sorravlstudios/pages/contact_page.dart';
import 'package:sorravlstudios/pages/error_page.dart';
import 'package:sorravlstudios/pages/home_page.dart';
import 'package:sorravlstudios/pages/privacy_policy.dart';
import 'package:sorravlstudios/pages/terms_and_conditions.dart';

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
            child: AppDetailsPage(appId: state.pathParameters['appId']!));
      },
    ),
    GoRoute(
      path: '/project/:appId/terms&conditions',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return NoTransitionPage(
            child: FindLoveTermsAndConditions(
                appId: state.pathParameters['appId']!));
      },
    ),
    GoRoute(
      path: '/project/:appId/privacy&policy',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return NoTransitionPage(
            child:
                FindLovePrivacyPolicy(appId: state.pathParameters['appId']!));
      },
    ),
    GoRoute(
      path: '/contact',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const NoTransitionPage(child: ContactPage());
      },
    ),
  ],
  errorPageBuilder: (context, state) {
    return NoTransitionPage(child: ErrorPage(path: state.matchedLocation));
  },
);
