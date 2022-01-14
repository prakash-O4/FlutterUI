import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virus_scan/config/colors.dart';
import 'package:virus_scan/config/data.dart';
import 'package:virus_scan/presentation/models/home_model.dart';
import 'package:virus_scan/presentation/screens/home/widgets/chips.dart';

class UserApps extends StatelessWidget {
  final bool isUser;
  const UserApps({Key? key, required this.isUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20),
              child: SelectChips(),
            ),
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return AppCard(
                  homeModel: isUser ? homeData[index] : homeData[index + 4],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AppCard extends StatelessWidget {
  final HomeModel homeModel;
  const AppCard({Key? key, required this.homeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage(homeModel.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Flexible(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        homeModel.name,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        homeModel.packagePath,
                        style: TextStyle(
                          color: AppColor.unSelectedColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Detected: ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor.unSelectedColor,
                              ),
                            ),
                            TextSpan(
                              text: "${homeModel.virus} ",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor.unSelectedColor,
                              ),
                            ),
                            TextSpan(
                              text: "Total: ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor.unSelectedColor,
                              ),
                            ),
                            TextSpan(
                              text: "${homeModel.total} ",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor.unSelectedColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: SizedBox(
              height: 18,
              width: 18,
              child: SvgPicture.asset(
                homeModel.status == DataStatus.complete
                    ? "assets/icons/safe.svg"
                    : homeModel.status == DataStatus.unknown
                        ? "assets/icons/question.svg"
                        : "assets/icons/x.svg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}