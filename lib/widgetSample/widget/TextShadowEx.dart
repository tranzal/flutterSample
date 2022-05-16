import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class TextShadowEx extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('글자 그림자'),
        ),
        body: const Center(
          child: Text(
            '글자 그림자 만듬',
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 6)
              ]
            ),
          ),
        )
    );
  }
}