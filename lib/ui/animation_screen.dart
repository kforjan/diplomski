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
  final List<AnimationController> _animationControllers = [];
  final List<Animation<double>> _animations = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.intensity; i++) {
      final animationController = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
      )..repeat();
      final animation =
          Tween<double>(begin: 0, end: 2 * pi).animate(animationController);

      _animationControllers.add(animationController);
      _animations.add(animation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Animacijas'),
      ),
      child: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Stack(
            children: List.generate(widget.intensity, (i) {
              final angle = 2 * pi / widget.intensity * i;
              final xPos = 100 * cos(angle);
              final yPos = 100 * sin(angle);

              return AnimatedBuilder(
                animation: _animations[i],
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _animations[i].value,
                    child: Transform.translate(
                      offset: Offset(xPos, yPos),
                      child: child,
                    ),
                  );
                },
                child: CircleAvatar(
                  backgroundColor: i % 2 == 0 ? Colors.red : Colors.yellow,
                  radius: 10,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
