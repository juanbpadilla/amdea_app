import 'package:amdea_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

  ThemeData currentTheme;

  ThemeProvider({
    required bool isDarkmode
  }): currentTheme = isDarkmode ? AppTheme.darkTheme : AppTheme.lightTheme;

  setLightMode() {
    currentTheme = AppTheme.lightTheme;
    notifyListeners();
  }

  setDarkmode() {
    currentTheme = AppTheme.darkTheme;
    notifyListeners();
  }

}