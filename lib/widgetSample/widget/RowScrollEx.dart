import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class RowScrollEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('행 스크롤'),
        ),
        body: SingleChildScrollView( //스크롤로 보겠다는 의미
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (num a = 0; a < 10; a++)
                Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue.shade900,
                    child: const Text('AH'),
                  ),
                  label: const Text('Hamilton'),
                )
            ],
          ),
        )
    );
  }
}
