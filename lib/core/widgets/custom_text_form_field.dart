import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      required this.hintText,
       this.prefixIconData,
      this.keyboardType,
      required this.controller,
      this.suffixIcon, this.onSubmitted});
  final String hintText;
  final IconData? prefixIconData;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final IconButton? suffixIcon;
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: Icon(
            prefixIconData,
          )),
    );
  }
}
