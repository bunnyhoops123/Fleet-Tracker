import 'package:fleettrack/pages/addvehicle.dart';
import 'package:fleettrack/pages/homepage.dart';
import 'package:fleettrack/pages/intropage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const IntroPage(),
        '/homepage': (context) => HomePage(),
        '/addvehicle': (context) => AddVehicle(),
      },
    );
  }
}
