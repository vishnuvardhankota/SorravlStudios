import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sorravlstudios/pages/app_details_page.dart';
import 'package:sorravlstudios/pages/careers_page.dart';
import 'package:sorravlstudios/pages/contact_page.dart';
import 'package:sorravlstudios/pages/csae_policy.dart';
import 'package:sorravlstudios/pages/home_page.dart';
import 'package:sorravlstudios/pages/privacy_policy.dart';
import 'package:sorravlstudios/pages/terms_and_conditions.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'provider/theme_provider.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setPathUrlStrategy();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: '/',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return NoTransitionPage(child: HomePage(path: state.path));
          },
        ),
        GoRoute(
          path: '/careers',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return NoTransitionPage(child: CareersPage(path: state.path));
          },
        ),
        GoRoute(
          path: '/project/:appId',
          pageBuilder: (BuildContext context, GoRouterState state) {
            final appId = state.pathParameters['appId'];
            return NoTransitionPage(child: AppDetailsPage(appId: appId!));
          },
        ),
        GoRoute(
          path: '/project/:appId/terms&conditions',
          pageBuilder: (BuildContext context, GoRouterState state) {
            final appId = state.pathParameters['appId'];
            return NoTransitionPage(
                child: FindLoveTermsAndConditions(appId: appId!));
          },
        ),
        GoRoute(
          path: '/project/:appId/privacy&policy',
          pageBuilder: (BuildContext context, GoRouterState state) {
            final appId = state.pathParameters['appId'];
            return NoTransitionPage(
                child: FindLovePrivacyPolicy(appId: appId!));
          },
        ),
        GoRoute(
          path: '/project/:appId/csae-policy',
          pageBuilder: (BuildContext context, GoRouterState state) {
            final appId = state.pathParameters['appId'];
            return NoTransitionPage(
                child: FindLoveCSAEPolicy(appId: appId!));
          },
        ),
        GoRoute(
          path: '/contact',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const NoTransitionPage(child: ContactPage());
          },
        ),
      ],
      errorBuilder: (context, state) => const HomePage(),
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Sorravl Studios',
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
