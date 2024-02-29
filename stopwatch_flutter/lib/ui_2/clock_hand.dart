import 'dart:math';

import 'package:flutter/material.dart';

class ClockHand1 extends StatelessWidget {
  const ClockHand1({
    super.key,
    required this.rotationZAngle,
    required this.handThinchkness,
    required this.handLength,
    required this.color,
  });

  final double rotationZAngle;
  final double handThinchkness;
  final double handLength;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..translate(
          -handThinchkness / 2,
          0,
          0,
        )
        ..rotateZ(rotationZAngle),
      child: Container(
        height: handLength,
        width: handThinchkness,
        color: color,
      ),
    );
  }
}
