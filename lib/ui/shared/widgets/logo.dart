import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.bubble_chart_outlined,
            color: Colors.purple,
          ),
          const SizedBox(width: 10),
          Text(
            'Admin',
            style: GoogleFonts.rubik(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}
