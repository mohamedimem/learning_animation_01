import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatelessWidget {
  const TweenAnimationBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TweenAnimationBuilder'),
      ),
      body: Center(child: HSVColorSelector()),
    );
  }
}

class HSVColorSelector extends StatefulWidget {
  const HSVColorSelector({super.key});

  @override
  State<HSVColorSelector> createState() => _HSVColorSelectorState();
}

class _HSVColorSelectorState extends State<HSVColorSelector> {
  double _hue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: 200,
          width: 200,
          color: HSVColor.fromAHSV(1, _hue, 1, 1).toColor(),
        ),
        SizedBox(
          height: 48,
        ),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: _hue),
          duration: Duration(milliseconds: 100),
          builder: (context, hue, child) {
            final _hsv = HSVColor.fromAHSV(1.0, hue, 1.0, 1.0);
            return Container(
              width: 200,
              height: 200,
              color: _hsv.toColor(),
            );
          },
        ),
        SizedBox(
          height: 48,
        ),
        Container(
          height: 30,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.yellow,
                Colors.green,
                Colors.cyan,
                Colors.blue,
                Colors.purple,
                Colors.red,
              ],
              // stops: [
              //   for (var i = 0; i <= 6; i++) i / 6,
              // ],
            ),
          ),
        ),
        Slider.adaptive(
            value: _hue,
            min: 0,
            max: 360,
            onChanged: (value) {
              setState(() {
                _hue = value;
              });
            }),
      ],
    );
  }
}
