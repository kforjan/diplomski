import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  final int intensity;

  const AnimationScreen({super.key, required this.intensity});

  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 2 * 3.14159265359)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Animacijas'),
      ),
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget? child) {
            return CustomPaint(
              size: const Size(200, 200),
              painter: _CirclePainter(
                  animationValue: _animation.value,
                  intensity: widget.intensity),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _CirclePainter extends CustomPainter {
  final double animationValue;
  final int intensity;

  _CirclePainter({required this.animationValue, required this.intensity});

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < intensity; i++) {
      final paint = Paint()
        ..color = i % 2 == 0 ? Colors.red : Colors.yellow
        ..style = PaintingStyle.fill;

      final angle = 2 * 3.14159265359 / intensity * i + animationValue;
      final xPos = size.width / 2 + size.width * cos(angle) / 1.3;
      final yPos = size.height / 2 + size.height * sin(angle) / 1.3;

      canvas.drawCircle(Offset(xPos, yPos), 10, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _CirclePainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}
