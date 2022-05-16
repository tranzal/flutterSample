import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class BackDropFilterEx extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('백 드랍 필터'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ExtendedImage.network(
            'https://i.pinimg.com/736x/8f/b0/c6/8fb0c64d558f54f720397467d23cc5b8.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 200.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    shape: BoxShape.rectangle,
                    color: Colors.white24
                  ),
                  child: const Text('백'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
