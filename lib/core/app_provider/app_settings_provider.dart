import 'package:flutter/material.dart';

class AppSettingsProvider extends ChangeNotifier {
  // language [arabic, english]
  String currentLanguage = 'en';
  ThemeMode currentTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    currentLanguage = newLanguage;
    notifyListeners();
  }

  // theme mode [light , dark]

  void changeTheme(ThemeMode newTheme) {
    currentTheme = newTheme;
    notifyListeners();
  }

  //    layout view
  int _currentIndex = 0;
  int get currentIndex => _currentIndex ;
  void changeCurrentIndex (int value){
    if(_currentIndex != value){
      _currentIndex = value ;
      notifyListeners() ;
    }
  }
}
