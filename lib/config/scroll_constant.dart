import 'package:flutter/material.dart';

class ScrollConstant extends StatelessWidget {
  final Widget child;
  const ScrollConstant({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (value) {
        value.disallowGlow();
        return true;
      },
      child: child,
    );
  }
}
