import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  const TextFieldLogin({
    super.key,
    required this.controller,
    required this.text,
    this.obscureText = false,
    required this.enabled,
    this.autofillHints,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.suffixIcon,
    this.validator,
    this.prefixIcon,
  });

  final TextEditingController controller;
  final String text;
  final bool obscureText;
  final bool enabled;
  final Iterable<String>? autofillHints;
  final TextInputType keyboardType;
  final void Function(String input)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String? input)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      autofillHints: autofillHints,
      enabled: enabled,
      validator: validator,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderSide:
                BorderSide(width: .9, color: Theme.of(context).backgroundColor),
            borderRadius: BorderRadius.circular(10),
          ),
          /*     enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: .9, color: Theme.of(context).backgroundColor),
          borderRadius: BorderRadius.circular(10),
        ), */
          /*       focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: .9, color: Theme.of(context).backgroundColor),
          borderRadius: BorderRadius.circular(5),
        ), */
          hintText: text,
          prefixIcon: prefixIcon
          /*   hintStyle: Theme.of(context).textTheme.headline5!.copyWith(
              color: Theme.of(context).hintColor,
            ), */
          ),
    );
  }
}
