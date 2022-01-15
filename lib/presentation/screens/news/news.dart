import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "News",
          style: Theme.of(context).textTheme.headline4!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: [
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset("assets/icons/search-normal.svg",
                color: Theme.of(context).iconTheme.color),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: Column(
            children: const [
              _NewsCard(),
              _NewsCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewsCard extends StatelessWidget {
  const _NewsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                "images/fbicon.png",
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 5),
                child: Text(
                  "How to check for Windows updates and install them",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 5),
                child: Text(
                  "In Malwarebytes by Malwarebytes Labs. Today, December 7",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 13,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 5),
                child: Text(
                  "We explain ins and outs of Windows updates and detail the many customisation features and settings on offer.",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 16,
                      ),
                  maxLines: 3,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
