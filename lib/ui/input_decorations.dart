import 'package:amdea_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class InputDecorations {

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    required BuildContext context,
    IconData? prefixIcon,
    String? suffixIcon,
    FocusNode? focusNode,
  }) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppTheme.primary,
          width: 2
        ),
      ),
      hintText: hintText,
      // labelText: labelText,
      labelStyle: const TextStyle(
        color: Color.fromARGB(255, 15, 14, 14)
      ),
      prefixIcon: prefixIcon != null
        ? Icon( prefixIcon, color: Theme.of(context).colorScheme.onPrimary )
        : null,
      suffixIcon: suffixIcon != null
        ? Image(image: AssetImage('assets/icons/$suffixIcon.png'),)
        : null,
    );
  }

}