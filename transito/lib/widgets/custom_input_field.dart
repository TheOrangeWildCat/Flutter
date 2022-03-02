import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? sufixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? counterText;

  final String formProperty;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.sufixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.counterText,
    required this.formProperty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        counterText: counterText,
        suffixIcon: sufixIcon == null ? null : Icon(sufixIcon),
        icon: icon == null ? null : Icon(icon),
      ),
    );
  }
}
