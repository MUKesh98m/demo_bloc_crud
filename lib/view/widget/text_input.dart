import 'package:flutter/material.dart';


class TextInputField extends StatelessWidget {
  final TextEditingController? controller;
  final IconData myIcon;
  final String? myLabelText;
  final bool toHide;
  final String hintText;
  final TextInputType? textInputType;
  final validator;
  final VoidCallback? OnClick;

  const TextInputField(
      {super.key,
      this.controller,
      required this.myIcon,
      this.myLabelText,
      this.toHide = false,
      required this.hintText,
      this.textInputType,
      this.validator,
      this.OnClick});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: toHide,
      controller: controller,
      validator: validator,
      keyboardType: textInputType,
      onTap: OnClick,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(myIcon),
        labelText: myLabelText,
        hintText: hintText,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
