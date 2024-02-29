import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stopwatch_flutter/ui/stopwatch.dart';
import 'package:stopwatch_flutter/ui_2/stopwatch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: Colors.black,
      // ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: AspectRatio(
                aspectRatio: 1,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final radius = constraints.maxWidth / 2;
                    return TextWatch(
                      radius: radius,
                    );
                  },
                )),
          ),
        ),
      ),
    );
  }
}
