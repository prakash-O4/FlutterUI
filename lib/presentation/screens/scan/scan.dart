import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virus_scan/config/colors.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Scan",
          style: Theme.of(context).textTheme.headline4!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: SizedBox(
                height: 88,
                width: 97,
                child: SvgPicture.asset(
                  "assets/icons/logo.svg",
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColor.selectedColor,
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
              ),
              onPressed: () {},
              child: Text(
                "Scan",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white,
                      fontSize: 15,
                    ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColor.darkAppBarColor,
                  padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                ),
                onPressed: () {},
                child: Text(
                  "Cancel",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
