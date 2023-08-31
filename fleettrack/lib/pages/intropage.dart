import 'package:fleettrack/components/mybutton.dart';
import 'package:fleettrack/models/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Fleet Track',
            style: GoogleFonts.dmSerifDisplay(
                fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            'assets/logo.png',
            height: 300,
          ),
          MyButton(
              text: "Get Started",
              onTap: () => Navigator.pushNamed(context, '/homepage'))
        ],
      ),
    );
  }
}
