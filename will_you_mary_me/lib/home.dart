import 'dart:math';

import 'package:flutter/material.dart';

class MarryMeScreen extends StatefulWidget {
  @override
  _MarryMeScreenState createState() => _MarryMeScreenState();
}

class _MarryMeScreenState extends State<MarryMeScreen> {
  double positionX = 0;
  double positionY = 0;
  double maxWidth = 0;
  double maxHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      maxWidth = MediaQuery.of(context).size.width - 170;
      maxHeight = MediaQuery.of(context).size.height - 170;
    });
  }

  void moveWidgetRandomly() {
    print('clicked');
    final random = Random();
    setState(() {
      positionX = random.nextDouble() * maxWidth;
      positionY = random.nextDouble() * maxHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 100, top: 20),
                child: Text(
                  'Will You Marry Me ? 💍👩‍❤‍👨💐',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      left: positionX,
                      top: positionY,
                      child: GestureDetector(
                        onTap: moveWidgetRandomly,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              'Yes',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          showAdaptiveDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                      image: AssetImage('asset/shocked.gif'),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              'No',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
