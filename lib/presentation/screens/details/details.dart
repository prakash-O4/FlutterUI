import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virus_scan/config/colors.dart';
import 'package:virus_scan/presentation/models/home_model.dart';
import 'package:virus_scan/presentation/screens/home/home_screen.dart';

class DetailsScreen extends StatelessWidget {
  final HomeModel homeModel;
  final int index;
  const DetailsScreen({
    Key? key,
    required this.homeModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: const SizedBox(),
            toolbarHeight: 200.0,
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 22,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          "assets/icons/trash.svg",
                          fit: BoxFit.cover,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Hero(
                    tag: homeModel.name + index.toString(),
                    child: Image.asset(
                      homeModel.imagePath,
                      height: 64,
                      width: 64,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    homeModel.name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const Spacer(),
                  TabBar(
                    indicator: CircleTabIndicator(
                      color: Theme.of(context).iconTheme.color!,
                      radius: 4,
                    ),
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
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              DetailsBody(homeModel: homeModel),
              DetailsBody(homeModel: homeModel),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.toggleOnColor,
            onPressed: () {},
            child: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                "assets/icons/arrow-up.svg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}

class DetailsBody extends StatelessWidget {
  final HomeModel homeModel;
  const DetailsBody({Key? key, required this.homeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        homeModel.status == DataStatus.complete
                            ? "Clean"
                            : homeModel.status == DataStatus.unknown
                                ? "Unknown"
                                : "Suspect",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        homeModel.packagePath.toString(),
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontSize: 19,
                            ),
                      ),
                      const SizedBox(height: 3),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const DetailsRow(
              boldText: "Installer:",
              description: "com.facebook.system(Installed by System)",
            ),
            const DetailsRow(
              boldText: "Type:",
              description: "SYSTEM",
            ),
            const DetailsRow(
              boldText: "Size:",
              description: "48.2 MB",
            ),
            const DetailsRow(
              boldText: "Scan Date: ",
              description: "Saturday, December 4",
            ),
            const DetailsRow(
              boldText: "Path:",
              description:
                  "/data/app/com.facebook.katana-dwihqduiwbfyuaewbfcgysda==/base.apk",
            ),
            const DetailsRow(
              boldText: "Sha256:",
              description:
                  "223838223470235732455705t7232654768d727fhhia94uasdfvsj21r413",
            ),
            const DetailsRow(
              boldText: "MD5",
              description: "Calculate MD5",
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsRow extends StatelessWidget {
  final String boldText;
  final String description;
  const DetailsRow({
    Key? key,
    required this.boldText,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(boldText,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 16)),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 7,
            child: Text(
              description,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
