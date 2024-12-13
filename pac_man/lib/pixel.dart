import 'package:flutter/material.dart';

/// A custom widget that represents a pixel-like UI component.
/// 
/// [innerColor] defines the inner background color.
/// [outerColor] defines the outer background color.
/// [child] is an optional widget placed inside the pixel.
class MyPixel extends StatelessWidget {
  final Color? innerColor;
  final Color? outerColor;
  final Widget? child;

  const MyPixel({
    this.innerColor,
    this.outerColor,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.all(12),
          color: outerColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
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
