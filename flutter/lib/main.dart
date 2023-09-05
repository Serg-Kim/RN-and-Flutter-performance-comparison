import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Stack(
            children: [...List<RotatedSquare>.generate(
              500,
                  (i) => const RotatedSquare(),
            ),
              const Center(
                child: Text('Welcome', style: TextStyle(fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),),
              )
            ]
        )
    );
  }
}

class RotatedSquare extends StatefulWidget {
  const RotatedSquare({super.key});

  @override
  State<RotatedSquare> createState() => _RotatedSquareState();
}

class _RotatedSquareState extends State<RotatedSquare> with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    return Positioned(
      top: Random().nextDouble() * (height - 20),
      left: Random().nextDouble() * (width - 20),
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(controller),
        child: Container(
          height: 20,
          width: 20,
          color: Colors.purple,
        ),
      ),
    );
  }
}
