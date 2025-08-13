import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode=ThemeMode.light;
  ChangeTheme(ThemeMode mode){
    if(mode==themeMode)return;
    themeMode=mode;
    notifyListeners();
  }
}