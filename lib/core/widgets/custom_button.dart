import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.backcolor,
      this.borderradius,
      required this.text,
      this.onPressed,
      required this.textStyle});
  final Color backcolor;
  final BorderRadiusGeometry? borderradius;
  final String text;
  final void Function()? onPressed;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: backcolor,
              shape: RoundedRectangleBorder(
                borderRadius: borderradius ?? BorderRadius.circular(12),
              )),
          onPressed: onPressed,
          child: Text(
            text,
            style: textStyle,
          )),
    );
  }
}
