import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/my_color.dart';

class AppThemes{

  AppThemes._();

  static final light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColor,primary: MyColors.primaryColor),
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily
  );
  static final dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: MyColors.secondaryColor,primary: MyColors.secondaryColor),
    useMaterial3: true,
     fontFamily: GoogleFonts.poppins().fontFamily
  );
}