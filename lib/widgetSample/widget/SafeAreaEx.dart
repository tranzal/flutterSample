import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
//화면 밖으로 빠지는 것을 빠지지 않도록 하는거
class SafeAreaEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('안전구역'),
        ),
        body: SafeArea(
          bottom: true,
          right: true,
          left: true,
          top: true,
          child: ExtendedImage.network(
            'https://i.pinimg.com/736x/8f/b0/c6/8fb0c64d558f54f720397467d23cc5b8.jpg',
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
          ),
        )
    );
  }
}
