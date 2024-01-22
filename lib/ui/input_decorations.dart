
import 'package:amdea_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class InputDecorations {

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    required BuildContext context,
    Color? borderColor,
    double fontSize = 18,
    IconData? prefixIcon,
    String? suffixIcon,
    FocusNode? focusNode,
  }) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: borderColor ?? Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppTheme.primary,
          width: 2
        ),
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        color: borderColor ?? Color.fromARGB(255, 15, 14, 14),
        fontSize: fontSize,
      ),
      errorStyle: TextStyle(
        fontSize: 14
      ),
      focusColor: AppTheme.primary,
      // labelText: labelText,
      labelStyle: TextStyle(
        color: borderColor ?? Color.fromARGB(255, 15, 14, 14)
      ),
      prefixIcon: prefixIcon != null
        ? Icon( prefixIcon, color: borderColor ?? Theme.of(context).colorScheme.onPrimary )
        : null,
      suffixIcon: suffixIcon != null
        ? Image(image: AssetImage('assets/icons/$suffixIcon.png'),)
        : null,
    );
  }

}