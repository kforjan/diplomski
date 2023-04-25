import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class IntensiveAnimationScreen extends StatefulWidget {
  const IntensiveAnimationScreen({required this.intensity, super.key});

  final int intensity;

  @override
  _IntensiveAnimationScreenState createState() =>
      _IntensiveAnimationScreenState();
}

class _IntensiveAnimationScreenState extends State<IntensiveAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _restartAnimation() {
    _controller.reset();
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Lightweight Animation'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _restartAnimation,
          child: const Icon(
            CupertinoIcons.restart,
            size: 24,
          ),
        ),
      ),
      child: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                size: Size.infinite,
                painter: IntensivePainter(_controller.value, widget.intensity),
              );
            },
          ),
        ),
      ),
    );
  }
}

class IntensivePainter extends CustomPainter {
  final double progress;
  final int lineCount;

  IntensivePainter(this.progress, this.lineCount);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = CupertinoColors.activeBlue;
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    for (int i = 0; i < lineCount; i++) {
      double angle = (i + progress * lineCount) % lineCount * math.pi / 180;
      double innerRadius = 100.0;
      double outerRadius = 200.0;
      double x1 = centerX + innerRadius * math.cos(angle);
      double y1 = centerY + innerRadius * math.sin(angle);
      double x2 = centerX + outerRadius * math.cos(angle);
      double y2 = centerY + outerRadius * math.sin(angle);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }
  }

  @override
  bool shouldRepaint(covariant IntensivePainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.lineCount != lineCount;
}
