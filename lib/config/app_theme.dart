import 'package:flutter/material.dart';
import 'package:virus_scan/config/colors.dart';

class AppTheme {
  static ThemeData buildLightTheme() {
    ThemeData lightTheme = ThemeData.light();
    lightTheme.copyWith(
      //colorScheme: const ColorScheme.light(),
      scaffoldBackgroundColor: AppColor.lightBackgroundColor,
      appBarTheme: AppBarTheme(backgroundColor: AppColor.toggleOnColor),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: AppColor.unSelectedColor,
        labelColor: Colors.black,
        //indicator: const BoxDecoration()
      ),
      cardColor: Colors.white,
      // ? insert text according to the necessity
      textTheme: const TextTheme().copyWith(),
      chipTheme: ChipThemeData.fromDefaults(
        primaryColor: Colors.white,
        secondaryColor: AppColor.unSelectedColor,
        labelStyle: const TextStyle(),
      ).copyWith(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.white,
        selectedColor: AppColor.selectedColor,
      ),
      bottomAppBarColor: Colors.white,
      unselectedWidgetColor: AppColor.unSelectedColor,
    );
    return lightTheme;
  }

  static ThemeData buildDarkTheme() {
    final ThemeData darkTheme = ThemeData.dark();
    darkTheme.copyWith(
     // colorScheme: const ColorScheme.light(),
      scaffoldBackgroundColor: AppColor.darkBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.darkAppBarColor,
      ),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: AppColor.unSelectedColor,
        labelColor: Colors.black,

        //indicator: const BoxDecoration()
      ),
      cardColor: AppColor.darkAppBarColor,
      // ? insert text according to the necessity
      textTheme: const TextTheme().copyWith(),
      chipTheme: ChipThemeData.fromDefaults(
        primaryColor: AppColor.unSelectedColor,
        secondaryColor: AppColor.unSelectedColor,
        labelStyle: const TextStyle(),
      ).copyWith(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.white,
        selectedColor: AppColor.selectedColor,
      ),
      bottomAppBarColor: AppColor.darkAppBarColor,
      unselectedWidgetColor: AppColor.unSelectedColor,
    );
    return darkTheme;
  }
}
