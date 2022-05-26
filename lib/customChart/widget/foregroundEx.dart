import 'package:flutter/material.dart';

/*
painter : painter > child 순으로 그려진다.
foregroundPainter : child > painter 순으로 그려진다.

크기는 기본적으로 부모 > 자식 > size 속성값 을 따른다.
아무것도 정해지지 않았다면 size를 위젯의 크기를 정한다.
size도 없으면 위젯은 그려지지 않는다.
 */
class ForegroundEx extends StatelessWidget {
  const ForegroundEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('선그리기'),
      ),
      body: Center(
        // 부모의 크기가 선언되었기에 400으로 위젯의 크기가 정해졌다.
        // 만약 자식과 Size만 있다면 자식의 사이즈로 위젯의 크기가 정해진다.
        child: Container(
          width: 300,
          height: 300,
          child: CustomPaint(
            size: const Size(0, 0),
            foregroundPainter: const MyPainter(p1: Offset(0, 0)),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ),
        ),
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