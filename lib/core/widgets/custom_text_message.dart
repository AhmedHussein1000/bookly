import 'package:bookly/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextMessage extends StatelessWidget {
  const CustomTextMessage({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: Styles.fontMedium18(context),
      ),
    );
  }
}
