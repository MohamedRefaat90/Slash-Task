import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slash_tesk/core/constants/app_colors.dart';

abstract class AppThemes {
  static final ThemeData mainTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme:
        GoogleFonts.josefinSansTextTheme().apply(displayColor: Colors.white),
  );
}
