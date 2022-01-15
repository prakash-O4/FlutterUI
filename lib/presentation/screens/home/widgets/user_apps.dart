import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virus_scan/config/valuenotif.dart';
import 'package:virus_scan/presentation/models/home_model.dart';
import 'package:virus_scan/presentation/screens/details/details.dart';
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
            ValueListenableBuilder(
              valueListenable: AppNotifier.choices,
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (AppNotifier.choices.value.toLowerCase() == "clean") {
                      var model = isUser
                          ? homeData[index].status
                          : homeData[index + 4].status;
                      if (model == DataStatus.complete) {
                        return AppCard(
                          homeModel:
                              isUser ? homeData[index] : homeData[index + 4],
                          index: isUser ? index : index + 4,
                        );
                      } else {
                        return const SizedBox();
                      }
                    } else if (AppNotifier.choices.value.toLowerCase() ==
                        "unknown") {
                      var model = isUser
                          ? homeData[index].status
                          : homeData[index + 4].status;
                      if (model == DataStatus.unknown) {
                        return AppCard(
                          homeModel:
                              isUser ? homeData[index] : homeData[index + 4],
                          index: isUser ? index : index + 4,
                        );
                      } else {
                        return const SizedBox();
                      }
                    } else if (AppNotifier.choices.value.toLowerCase() ==
                        "suspect") {
                      var model = isUser
                          ? homeData[index].status
                          : homeData[index + 4].status;
                      if (model == DataStatus.danger) {
                        return AppCard(
                          homeModel:
                              isUser ? homeData[index] : homeData[index + 4],
                          index: isUser ? index : index + 4,
                        );
                      } else {
                        return const SizedBox();
                      }
                    } else {
                      return AppCard(
                        homeModel:
                            isUser ? homeData[index] : homeData[index + 4],
                        index: isUser ? index : index + 4,
                      );
                    }
                  },
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
  final int index;
  const AppCard({Key? key, required this.homeModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailsScreen(
                homeModel: homeModel,
                index: index,
              );
            },
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 10),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Hero(
                      tag: homeModel.name + index.toString(),
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
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontSize: 18),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          homeModel.packagePath,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(height: 4),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Detected: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              TextSpan(
                                text: "${homeModel.virus} ",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              TextSpan(
                                text: "Total: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              TextSpan(
                                text: "${homeModel.total} ",
                                style: Theme.of(context).textTheme.headline5,
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
      ),
    );
  }
}
