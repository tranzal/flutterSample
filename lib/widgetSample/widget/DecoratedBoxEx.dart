import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class DecoratedBoxEx extends StatefulWidget {
  @override
  State<DecoratedBoxEx> createState() => _DecoratedBoxEx();
}

class _DecoratedBoxEx extends State<DecoratedBoxEx> with TickerProviderStateMixin {

  //시작과 끝의 모양을 정의
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(100),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x66666666),
          blurRadius: 10.0,
          spreadRadius: 3.0,
          offset: Offset(0, 6.0)
        )
      ]
    ),
    end: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.zero
    )
  );

  //어떤 방식으로 몇초마다 할 것인지 정의
  late final AnimationController _controller = AnimationController(
      vsync: this,
    duration: const Duration(seconds: 1)
  )..repeat(reverse: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('박스 데코'),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: DecoratedBoxTransition(
              decoration: decorationTween.animate(_controller),
              child: Container(
                width: 200,
                height: 200,
              ),
            ),
          ),
        )
    );
  }
}