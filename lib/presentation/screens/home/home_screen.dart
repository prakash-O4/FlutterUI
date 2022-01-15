// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virus_scan/config/colors.dart';
import 'package:virus_scan/presentation/screens/home/widgets/home_body.dart';
import 'package:virus_scan/presentation/screens/news/news.dart';
import 'package:virus_scan/presentation/screens/scan/scan.dart';
import 'package:virus_scan/presentation/screens/settings/setttings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeBody(),
    ScanScreen(),
    SizedBox(),
    NewsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[currentIndex]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 26,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "Apps",
            icon: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                "assets/icons/app.svg",
                color: currentIndex == 0
                    ? AppColor.selectedColor
                    : AppColor.unSelectedColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "Scan",
            icon: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                "assets/icons/scan.svg",
                color: currentIndex == 1
                    ? AppColor.selectedColor
                    : AppColor.unSelectedColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: const SizedBox(),
          ),
          BottomNavigationBarItem(
            label: "News",
            icon: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                "assets/icons/news.svg",
                color: currentIndex == 3
                    ? AppColor.selectedColor
                    : AppColor.unSelectedColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                "assets/icons/setting.svg",
                color: currentIndex == 4
                    ? AppColor.selectedColor
                    : AppColor.unSelectedColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _painter;
  }
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
