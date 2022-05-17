import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class AnimatedCrossFadeEx extends StatefulWidget {
  @override
  State<AnimatedCrossFadeEx> createState() => _AnimatedCrossFadeExState();
}

class _AnimatedCrossFadeExState extends State<AnimatedCrossFadeEx> {

  bool _first = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('이미지 바뀌는거'),
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              _first = !_first;
            });
          },
          child: Center(
            child: AnimatedCrossFade(
              duration: const Duration(seconds: 1),
              firstChild: const BoxContainer(color: Colors.red),
              secondChild: const BoxContainer(color: Colors.blue),
              crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
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

