import 'package:flutter/material.dart';

class AppTheme {

  static const Color primary = Color(0xFF2C2F88);
  static const Color secondary = Color(0xFF1E1E1E);
  static const Color lightGrayColor = Color(0xFFF3F3F3);
  static const Color background = Colors.white;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primary,
      secondaryHeaderColor: secondary,
      
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: primary,
          onPrimary: secondary,
          secondary: secondary,
          onSecondary: background,
          error: Colors.red,
          onError: Color.fromARGB(255, 244, 228, 54),
          background: background,
          onBackground: secondary,
          surface: lightGrayColor,
          onSurface: secondary),      
      
      textTheme: const TextTheme(
        
        titleLarge: TextStyle(
          fontFamily: 'Montserrat_Bold',
          fontSize: 38,
          color: secondary,
        ),

        bodyMedium: TextStyle(
          fontFamily: 'Monserrat',
            color: AppTheme.secondary,
            fontSize: 22,
            fontWeight: FontWeight.w400
        )
      ),

      // bottomNavigationBarTheme:
      //     const BottomNavigationBarThemeData(backgroundColor: Colors.white)
  );


  static final ThemeData darkTheme = ThemeData.dark().copyWith();

}