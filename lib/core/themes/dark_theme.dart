import 'package:bookly/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.black,
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: _customOutlineBorder(),
        focusedBorder: _customOutlineBorder(width: 2),
        errorBorder: _customOutlineBorder(
          color: Colors.red,
        ),
        focusedErrorBorder:
            _customOutlineBorder(color: Colors.red, width: 2.0)));

OutlineInputBorder _customOutlineBorder({Color? color, double? width}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: color ?? Colors.white, width: width ?? 1.0),
  );
}
