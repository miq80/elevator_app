import 'package:flutter/material.dart';

class ConditionalSizedBox extends StatelessWidget {
  final double? width;

  final Widget child;
  ConditionalSizedBox({required this.width, required this.child});

  @override
  Widget build(BuildContext context) {
    return width != null
        ? SizedBox(
            width: width,
            child: child,
          )
        : child;
  }
}
