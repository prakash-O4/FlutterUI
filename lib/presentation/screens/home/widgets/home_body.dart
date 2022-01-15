import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:virus_scan/config/colors.dart';
import 'package:virus_scan/presentation/screens/home/widgets/user_apps.dart';

import '../home_screen.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              //floating: true,
              pinned: true,
              // toolbarHeight: 70.0,
              title: Text(
                "VirusTotal",
                style: Theme.of(context).textTheme.headline4,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SvgPicture.asset(
                    "assets/icons/search-normal.svg",
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
              bottom: TabBar(
                indicator: CircleTabIndicator(
                    color: Theme.of(context).iconTheme.color!, radius: 4),
                labelPadding: const EdgeInsets.only(bottom: 16),
                labelStyle: Theme.of(context).tabBarTheme.labelStyle,
                tabs: const [
                  Text(
                    "User Apps",
                  ),
                  Text(
                    "System Apps",
                  ),
                ],
              ),
            ),
          ];
        },
        body: const TabBarView(
          children: [
            UserApps(isUser: true),
            UserApps(isUser: false),
          ],
        ),
      ),
    );
  }
}
