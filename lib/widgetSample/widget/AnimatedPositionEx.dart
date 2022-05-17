import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class AnimatedPositionFadeEx extends StatefulWidget {
  @override
  State<AnimatedPositionFadeEx> createState() => _AnimatedPositionFadeEx();
}

class _AnimatedPositionFadeEx extends State<AnimatedPositionFadeEx> {

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('박스 움직임'),
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                  height: selected ? 50 : 200,
                  width: selected ? 200 : 50,
                  bottom: selected ? 50 : 300,
                  left: selected ? 150 : 0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = !selected;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                        shape: BoxShape.rectangle
                      ),
                      child: const Center(child: Text('tap me')),
                    ),
                  )
              )
            ],
          ),
        )
    );
  }
}

class BoxContainer extends StatelessWidget {
  final Color color;
  const BoxContainer({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: color,
    );
  }
}

