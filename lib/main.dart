import 'package:flutter/material.dart';
import 'package:galaxy_planet_pr2/views/screens/detail.dart';
import 'package:galaxy_planet_pr2/views/screens/home.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        '/': (context) => const Home(),
        'detail': (context) => const detail(),
      },
    );
  }
}
