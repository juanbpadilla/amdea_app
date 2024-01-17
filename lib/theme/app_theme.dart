import 'package:flutter/material.dart';

class AppTheme {

  static const Color primary = Color(0xFF2C2F88);
  static const Color secondary = Color(0xFF1E1E1E);
  static const Color lightGrayColor = Color(0xFFF3F3F3);
  static const Color background = Colors.white;
  // static const Color grayColor = Color(0xFFC7C7C7);
  static const Color grayColor = Color(0xFFA6A6A6);
  static const Color greenColor = Color(0xFF289618);

  static const String primaryFont ='Montserrat';
  static const String blackFont ='Montserrat_Black';
  static const String boldFont ='Montserrat_Bold';
  static const String lightFont ='Montserrat_Light';
  static const String mediumFont ='Montserrat_Medium';

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primary,
      secondaryHeaderColor: secondary,
      
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: primary,
          onPrimary: grayColor,
          secondary: secondary,
          onSecondary: background,
          error: Colors.red,
          onError: Color.fromARGB(255, 244, 228, 54),
          background: background,
          onBackground: secondary,
          surface: lightGrayColor,
          onSurface: secondary),      
      
      textTheme: const TextTheme(

        headlineSmall: TextStyle(
          fontFamily: 'Montserrat_Medium',
          fontSize: 30
        ),
        
        titleLarge: TextStyle(
          fontFamily: 'Montserrat_Bold',
          fontSize: 38,
          color: secondary,
        ),

        titleMedium: TextStyle(
          fontFamily: 'Montserrat_medium',
          fontSize: 40,
          fontWeight: FontWeight.w500,
          color: primary
        ),

        bodySmall: TextStyle(
          fontFamily: 'Montserrat_Medium',
            color: AppTheme.background,
            fontSize: 20,
            fontWeight: FontWeight.w500
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