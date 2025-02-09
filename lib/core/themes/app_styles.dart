import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle fontRegular14(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeight.w400,
      );
  static TextStyle fontMedium14(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeight.w500,
      );
  static TextStyle fontRegular16(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w400,
      );

  static TextStyle fontBold16(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w700,
      );

  static TextStyle fontMedium18(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w500,
      );

  static TextStyle fontBold18(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w700,
      );
  static TextStyle fontMedium20(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w500,
      );

  static TextStyle fontSemiBold20(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w600,
      );

  static TextStyle fontSemiBold28(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 28),
        fontWeight: FontWeight.w600,
      );
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width / 412;
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  double responsiveFontSize = fontSize * getScaleFactor(context);
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}
