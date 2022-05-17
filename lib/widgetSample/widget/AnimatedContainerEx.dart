import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class AnimatedContainerFadeEx extends StatefulWidget {
  @override
  State<AnimatedContainerFadeEx> createState() => _AnimatedContainerFadeEx();
}

class _AnimatedContainerFadeEx extends State<AnimatedContainerFadeEx> {

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('이미지 바뀌는거'),
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: Center(
            child: AnimatedContainer(
              width: selected ? 300 : 100,
              height: selected ? 100 : 300,
              color: selected ? Colors.red : Colors.blue,
              alignment: selected ? Alignment.center : Alignment.topCenter,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: const BoxContainer(color: Colors.black),
            ),
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

