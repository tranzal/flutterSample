import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class TextOverFlowEx extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('글자 오버플로우'),
        ),
        body: const Center(
          child: Text(
            '글자 그림자 만듬글자 그림자 만듬글자 그림자 만듬글자 그림자 만듬글자 그림자 만듬글자 그림자 만듬',
            textScaleFactor: 2,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        )
    );
  }
}