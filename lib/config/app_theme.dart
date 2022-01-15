import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virus_scan/config/colors.dart';

class AppTheme {
  static ThemeData buildLightTheme() {
    return ThemeData(
      //colorScheme: const ColorScheme.light(),
      scaffoldBackgroundColor: AppColor.lightBackgroundColor,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: AppColor.unSelectedColor,
        labelColor: Colors.black,
      ),
      cardColor: Colors.white,
      // ? insert text according to the necessity
      textTheme: const TextTheme().copyWith(
        headline4: GoogleFonts.roboto(
          textStyle: const TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        headline5: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: 16,
            color: AppColor.unSelectedColor,
          ),
        ),
        subtitle1: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: 14,
            color: AppColor.unSelectedColor,
          ),
        ),
        subtitle2: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: 14,
            color: AppColor.selectedColor,
          ),
        ),
      ),
      chipTheme: ChipThemeData.fromDefaults(
        primaryColor: Colors.white,
        secondaryColor: Colors.white,
        labelStyle: const TextStyle(),
      ).copyWith(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      dividerTheme: DividerThemeData(color: AppColor.dividerColor),
      iconTheme: const IconThemeData(color: Colors.black),
      bottomAppBarColor: Colors.white,
      unselectedWidgetColor: AppColor.unSelectedColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: 12,
            color: AppColor.selectedColor,
          ),
        ),
        unselectedLabelStyle: GoogleFonts.roboto(
          textStyle: const TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  static ThemeData buildDarkTheme() {
    return ThemeData(
      // colorScheme: const ColorScheme.dark(),
      scaffoldBackgroundColor: AppColor.darkBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.darkAppBarColor,
      ),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: AppColor.unSelectedColor,
        labelColor: Colors.white,
        labelStyle: GoogleFonts.roboto(
          textStyle: const TextStyle(
            fontSize: 18,
          ),
        ),
        //indicator: const BoxDecoration()
      ),
      cardColor: AppColor.darkAppBarColor,
      // ? insert text according to the necessity
      textTheme: const TextTheme().copyWith(
        headline4: GoogleFonts.roboto(
          textStyle: const TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        headline5: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: 16,
            color: AppColor.unSelectedColor,
          ),
        ),
        subtitle1: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: 14,
            color: AppColor.unSelectedColor,
          ),
        ),
        subtitle2: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: 14,
            color: AppColor.selectedColor,
          ),
        ),
      ),
      chipTheme: ChipThemeData.fromDefaults(
        primaryColor: AppColor.darkAppBarColor,
        secondaryColor: Colors.transparent,
        labelStyle: const TextStyle(),
      ).copyWith(
        side: BorderSide(color: AppColor.darkAppBarColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        //this will used as selected color background
        secondarySelectedColor: AppColor.darkAppBarColor,
        backgroundColor: AppColor.darkAppBarColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColor.toggleOnColor,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.darkAppBarColor,
        selectedLabelStyle: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: 12,
            color: AppColor.selectedColor,
          ),
        ),
      ),
      dividerTheme: DividerThemeData(color: AppColor.darkAppBarColor),
      unselectedWidgetColor: AppColor.unSelectedColor,
    );
  }
}
