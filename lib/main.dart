import 'package:flutter/material.dart';
import 'package:sorravlstudios/widgets/router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'provider/theme_provider.dart';
import 'theme/theme.dart';

void main() async{
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Sorravl Studios',
      themeMode: themeProvider.themeMode,
      theme: PAppTheme.lightTheme,
      darkTheme: PAppTheme.darkTheme,
      routerConfig: router,
    );
  }
}
