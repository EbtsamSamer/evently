import 'package:evently/core/colors/light_colors.dart';
import 'package:evently/core/colors/main_colors.dart';
import 'package:flutter/material.dart';

final MainColors colors = LightColors(); //global instance

class AppTheming {
  static ThemeData lighttheme = ThemeData(
    scaffoldBackgroundColor:Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(),
    textTheme: TextTheme(),
  );
  static ThemeData darktheme = ThemeData(
    scaffoldBackgroundColor:Color(0xFF101127),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor:Color(0xFF101127),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(),
    textTheme: TextTheme(),
  );
}
