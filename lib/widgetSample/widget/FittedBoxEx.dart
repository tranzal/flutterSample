import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class FittedBoxEx extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('이미지 채우기'),
        ),
        body: Center(
          child: Container(
            height: 500,
            width: 300,
            color: Colors.red,
            child: FittedBox(
              fit: BoxFit.cover,
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                  'https://i.pinimg.com/736x/8f/b0/c6/8fb0c64d558f54f720397467d23cc5b8.jpg'
              ),
            ),
          ),
        )
    );
  }
}