import 'package:fleettrack/pages/addvehicle.dart';
import 'package:fleettrack/pages/homepage.dart';
import 'package:fleettrack/pages/intropage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //init the hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox('fleetBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const IntroPage(),
        '/homepage': (context) => HomePage(),
        '/addvehicle': (context) => AddVehicle(),
      },
    );
  }
}
