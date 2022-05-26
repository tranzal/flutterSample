import 'package:flutter/material.dart';

class CustomPaintLineEx extends StatelessWidget {
  const CustomPaintLineEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('선그리기'),
      ),
      body: const CustomPaint(
        size: Size(100, 100),
        painter: MyPainter(p1: Offset(100.0, 400.0)),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  const MyPainter({required this.p1});
  final Offset p1;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      //색 정하기
        ..color = Colors.deepOrangeAccent
      //선의 끝부분 표현
        ..strokeCap = StrokeCap.square
      // 선의 굵기
        ..strokeWidth = 8.0;

    //좌표
    var p2 = Offset(size.width, size.height);

    //선 그리기 명령
    canvas.drawLine(p1, p2, paint);
  }

  //화면을 새로 그릴지 아닌지 정할 수 있다. 조건도 추가 가능
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}