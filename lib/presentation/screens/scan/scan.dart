import 'package:flutter/material.dart';
import 'package:virus_scan/config/colors.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Scan Page",
          style: TextStyle(
            fontSize: 20,
            color: AppColor.unSelectedColor,
          ),
        ),
      ),
    );
  }
}
