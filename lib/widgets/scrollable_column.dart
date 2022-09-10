import 'package:flutter/material.dart';

class ScrollableColumn extends StatelessWidget {
  const ScrollableColumn({
    Key? key,
    this.padding,
    this.maxWidth,
    this.gap,
    required this.children,
  }) : super(key: key);

  final EdgeInsetsGeometry? padding;
  final double? maxWidth;
  final double? gap;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final childrenWithGap = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      childrenWithGap.add(children[i]);

      if (i != children.length - 1) {
        childrenWithGap.add(SizedBox(height: gap));
      }
    }

    return SizedBox.expand(
      child: SingleChildScrollView(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: maxWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: childrenWithGap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
