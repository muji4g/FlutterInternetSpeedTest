import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speed_test/provider/internetspeed_provider.dart';
import 'package:speed_test/provider/theme_provider.dart';

import 'package:speed_test/theme/apptheme.dart';
import 'package:speed_test/views/homepage.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => InternetspeedProvider(),
    ),
    ChangeNotifierProvider(create: (context) => ThemeProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = ThemeProvider();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterSpeed',
      themeMode: themeProvider.themeMode,
      theme:
          ThemeData(useMaterial3: true, colorScheme: themeProvider.lightScheme),
      darkTheme:
          ThemeData(useMaterial3: true, colorScheme: themeProvider.darkScheme),
      home: const HomePage(),
    );
  }
}
