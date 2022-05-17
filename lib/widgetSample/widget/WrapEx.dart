import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
//화면 밖으로 빠지는 것을 빠지지 않도록 하는거
class WrapEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('랩'),
        ),
        body: Wrap(
          children: <Widget>[
            for (num a = 0; a < 10; a++)
              Chip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  child: const Text('AH'),
                ),
                label: const Text('Hamilton'),
              )
          ],
        ));
  }
}
