import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        decoration: BoxDecoration(
            border: Border.all(width: 2),
            boxShadow: [BoxShadow(spreadRadius: 2, offset: Offset(2, 2))],
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.dmSerifDisplay(
                  fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}
