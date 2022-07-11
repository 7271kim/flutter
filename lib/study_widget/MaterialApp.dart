import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialAppStudy {
  Widget study() {
    return Builder(
      builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.getTextTheme('Jua'),
        ),
        home: Scaffold(),
      ),
    );
  }
}
