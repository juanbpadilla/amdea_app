import 'package:amdea_app/pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Al Toque',
      initialRoute: 'welcome',
      routes: {
        'welcome': ( _ ) => WelcomePage(),
        'home': (_) => HomePage(),
      },

    );
  }
}
