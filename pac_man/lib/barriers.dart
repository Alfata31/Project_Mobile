import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {
  final Color innerColor;
  final Color outerColor;
  final Widget child;

  const MyBarrier({
    Key? key,
    required this.innerColor,
    required this.outerColor,
    required this.child,
  }) : super(key: key);

  static const double outerPadding = 1.0;
  static const double outerBorderRadius = 6.0;
  static const double outerContainerPadding = 12.0;
  static const double innerBorderRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(outerPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(outerBorderRadius),
        child: Container(
          padding: const EdgeInsets.all(outerContainerPadding),
          color: outerColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(innerBorderRadius),
            child: Container(
              color: innerColor,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
