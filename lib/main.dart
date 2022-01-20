import 'package:flutter/material.dart';
import 'package:virus_scan/config/app_theme.dart';
import 'package:virus_scan/config/scroll_constant.dart';
import 'package:virus_scan/config/valuenotif.dart';
import 'package:virus_scan/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppNotifier.appTheme.value
              ? AppTheme.buildDarkTheme()
              : AppTheme.buildLightTheme(),
          home: const ScrollConstant(child: HomeScreen()),
          debugShowCheckedModeBanner: false,
        );
      },
      valueListenable: AppNotifier.appTheme,
    );
  }
}
