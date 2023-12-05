import 'package:amdea_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class InputDecorations {

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
    FocusNode? focusNode,
  }) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppTheme.secondary,
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
        ? Icon( prefixIcon, color: AppTheme.secondary )
        : null
    );
  }

}