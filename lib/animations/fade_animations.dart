import 'package:flutter/material.dart';
import 'package:apk3/widgets/scale_animated_widget.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({ required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScaleAnimatedWidget(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: const Duration(milliseconds: 500),
      scale: Tween<double>(begin: 0.0, end: 1.0),
      translation: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ),
      child: child,
    );
  }
}