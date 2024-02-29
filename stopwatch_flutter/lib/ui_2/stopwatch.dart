import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';
import 'package:stopwatch_flutter/ui_2/clock_hand.dart';
import 'package:stopwatch_flutter/ui_2/clock_markers1.dart';
import 'package:stopwatch_flutter/ui_2/elapsed_time_text_basic.dart';

class TextWatch extends StatefulWidget {
  const TextWatch({super.key, required this.radius});
  final double radius;

  @override
  State<TextWatch> createState() => _TextWatchState();
}

class _TextWatchState extends State<TextWatch>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;

  Duration _elapsedTime = Duration.zero;

  @override
  void initState() {
    _ticker = createTicker((elapsed) {
      setState(() {
        _elapsedTime = elapsed;
      });
    });
    _ticker.start();

    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  /// Global key used to manipulate the state of the StopwatchTickerUI

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 60; i++)
          ClockMarker(
            radius: widget.radius,
            seconds: i,
          ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
        ),
        Positioned(
          left: widget.radius,
          top: widget.radius,
          child: ClockHand1(
              rotationZAngle:
                  pi + (2 * pi / 60000) * _elapsedTime.inMilliseconds,
              handThinchkness: 5,
              handLength: widget.radius,
              color: Colors.black),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: widget.radius * 1.3,
          child: StopWatch_render(
            elapsedTime: _elapsedTime,
          ),
        )
      ],
    );
  }
}

class StopWatch_render extends StatelessWidget {
  const StopWatch_render({super.key, required this.elapsedTime});

  final Duration elapsedTime;

  @override
  Widget build(BuildContext context) {
    return ElapsedTimeText(
      elapsed: elapsedTime,
      radius: 0,
    );
  }
}
