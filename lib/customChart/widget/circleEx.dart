import 'dart:math';

import 'package:flutter/material.dart';

class CircleEx extends StatelessWidget {
  const CircleEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('원그리기'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: const Center(
          child: CustomPaint(
            size: Size(100, 100),
            painter: MyPainter(p1: Offset(100.0, 400.0), percentage: 20),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  const MyPainter({required this.p1, required this.percentage, this.textScaleFactor = 1.0});
  final Offset p1;
  final int percentage;
  final double textScaleFactor;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
    //색 정하기
      ..color = Colors.indigo
    //선의 끝부분 표현
      ..strokeCap = StrokeCap.round
    // 선의 굵기
      ..strokeWidth = 8.0
      ..style = PaintingStyle.stroke;

    //원의 반지름 구하기. 선의 굵기에 영향을 받지 않도록 보정
    double radius = min(size.width / 2 - paint.strokeWidth / 2, size.height / 2 - paint.strokeWidth / 2);

    //그래프가 가운데로 그려지도록 좌표를 정한다.
    var center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    // 호의 각도를 정한다. 원하는 percentage 만큼 그린다.
    var arcAngle = 2 * pi * (percentage / 100.0);

    // percentage 색 변경.
    paint.color = Colors.deepOrangeAccent;

    //호 그리기
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, arcAngle, false, paint);

    drawText(canvas, size, '$percentage / 100');
  }

  //원 중앙에 텍스트 작성
  void drawText(Canvas canvas, Size size, String text) {
    var fontSize = getFontSize(size, text);

    var sp = TextSpan(
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),
      text: text
    );

    var tp = TextPainter(text: sp, textDirection: TextDirection.ltr);

    // 필수 호출. 텍스트의 크기와 방향을 결정한다.
    tp.layout();

    var dx = size.width / 2 - tp.width / 2;
    var dy = size.height / 2 - tp.height / 2;

    var offset = Offset(dx, dy);

    tp.paint(canvas, offset);
  }

  double getFontSize(Size size, String text) {
    return size.width / text.length * textScaleFactor;
  }

  //화면을 새로 그릴지 아닌지 정할 수 있다. 조건도 추가 가능
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}