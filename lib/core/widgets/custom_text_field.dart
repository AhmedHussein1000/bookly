import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      required this.hintText,
      this.prefixIconData,
      this.keyboardType,
      required this.controller,
      this.suffixIcon,
      this.onChanged});
  final String hintText;
  final IconData? prefixIconData;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final IconButton? suffixIcon;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      onChanged: onChanged,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          suffixIcon: suffixIcon,
          prefixIcon: Icon(
            prefixIconData,
          )),
    );
  }
}
