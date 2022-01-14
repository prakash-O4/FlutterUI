import 'package:flutter/material.dart';
import 'package:virus_scan/config/colors.dart';
import 'package:virus_scan/config/data.dart';

class SelectChips extends StatefulWidget {
  const SelectChips({Key? key}) : super(key: key);

  @override
  State<SelectChips> createState() => _SelectChipsState();
}

class _SelectChipsState extends State<SelectChips> {
  String selectedData = "All";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: slideData.map((e) {
        return Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: ChoiceChip(
            onSelected: (select) {
              setState(() {
                selectedData = e;
              });
            },
            disabledColor: Colors.white,
            backgroundColor: Colors.white,
            selectedColor: Colors.white,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            label: Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Text(
                e,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight:
                      selectedData == e ? FontWeight.w500 : FontWeight.normal,
                  color: selectedData == e
                      ? AppColor.selectedColor
                      : AppColor.unSelectedColor,
                ),
              ),
            ),
            selected: selectedData == e,
          ),
        );
      }).toList()),
    );
  }
}


/**
 SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: slideData.map((e) => ScrollChip(text: e)).toList(),
                ),
              ),
 */