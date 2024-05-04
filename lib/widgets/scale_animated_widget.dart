import 'package:flutter/widgets.dart';

class ScaleAnimatedWidget extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final Tween<double> scale;
  final Tween<Offset> translation;

  const ScaleAnimatedWidget({super.key, 
    required this.child,
    required this.delay,
    required this.duration,
    required this.scale,
    required this.translation,
    this.curve = Curves.linear,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ScaleAnimatedWidgetState createState() => _ScaleAnimatedWidgetState();
}

class _ScaleAnimatedWidgetState extends State<ScaleAnimatedWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _translationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ).drive(widget.scale);

    _translationAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ).drive(widget.translation);

    Future.delayed(widget.delay, () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SlideTransition(
          position: _translationAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}