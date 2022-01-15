import 'package:flutter/material.dart';
import 'package:virus_scan/config/colors.dart';
import 'package:virus_scan/config/data.dart';
import 'package:virus_scan/config/valuenotif.dart';

class SelectChips extends StatefulWidget {
  const SelectChips({Key? key}) : super(key: key);

  @override
  State<SelectChips> createState() => _SelectChipsState();
}

class _SelectChipsState extends State<SelectChips> {
  String selectedData = "All";
  AppNotifier appNotifier = AppNotifier();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: slideData.map((e) {
        return Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: ChoiceChip(
            labelPadding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
            onSelected: (select) {
              setState(() {
                selectedData = e;
                appNotifier.changeValue(e);
              });
            },
            elevation: 0,
            pressElevation: 0,
            label: Text(
              e,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: selectedData == e
                        ? AppColor.selectedColor
                        : AppColor.unSelectedColor,
                  ),
            ),
            selected: selectedData == e,
          ),
        );
      }).toList()),
    );
  }
}
