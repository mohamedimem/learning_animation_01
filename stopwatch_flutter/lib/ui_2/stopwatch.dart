import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';
import 'package:stopwatch_flutter/ui_2/elapsed_time_text_basic.dart';

class TextWatch extends StatefulWidget {
  const TextWatch({super.key});

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
        Transform(
          transform: Matrix4.identity()
            ..rotateZ(pi / 4)
            ..rotateY(10),
          alignment: Alignment.center,
          child: Container(
            color: Colors.indigo,
          ),
        ),
        // StopWatch_render(
        //   elapsedTime: _elapsedTime,
        // )
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
    );
  }
}
