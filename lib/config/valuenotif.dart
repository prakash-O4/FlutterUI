import 'package:flutter/material.dart';

class AppNotifier {
  static ValueNotifier<String> choices = ValueNotifier("");
  static ValueNotifier<bool> appTheme = ValueNotifier(false);
  void changeValue(String vals) {
    choices.value = vals;
  }

  void changeTheme(bool value) {
    appTheme.value = value;
  }
}
