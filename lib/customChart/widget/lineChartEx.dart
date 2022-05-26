import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

/*
drawPath : 선을 그릴 때 사용. path의 좌표를 따라 선을 그린다.
drawPoints : 점을 그릴 때 사용
 */
class LineChartEx extends StatelessWidget {
  const LineChartEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('선형 차트 그리기'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(
          child: CustomPaint(
            size: const Size(300, 300),
            foregroundPainter: LineChart(
                points: <double>[100, 55, 10, 2, 120, 150, 35, 55, 75, 135],
                lineWidth: 5.0,
                pointSize: 15.0,
                fontSize: 18.0,
                lineColor: Colors.deepOrangeAccent,
                pointColor: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}

class LineChart extends CustomPainter {
  List<double> points;
  final double lineWidth;
  final double pointSize;
  final double fontSize;
  final Color lineColor;
  final Color pointColor;
  late int maxValueIndex;
  late int minValueIndex;

  LineChart({
    required this.points,
    required this.lineWidth,
    required this.pointSize,
    required this.fontSize,
    required this.lineColor,
    required this.pointColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    List<Offset> offsets = getCoordinates(points, size);

    drawText(canvas, offsets);

    drawLines(canvas, size, offsets);

    drawPoints(canvas, size, offsets);
  }

  @override
  bool shouldRepaint(LineChart oldDelegate) {
    return oldDelegate.points != points;
  }

  void drawLines(Canvas canvas, Size size, List<Offset> offsets) {
    var paint = Paint()
        ..color = lineColor
        ..strokeWidth = lineWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

    var path = Path();

    var dx = offsets[0].dx;
    var dy = offsets[0].dy;

    path.moveTo(dx, dy);
    offsets.map((e) => path.lineTo(e.dx, e.dy)).toList();

    canvas.drawPath(path, paint);
  }

  void drawPoints(Canvas canvas, Size size, List<Offset> offsets) {
    var paint = Paint()
        ..color = pointColor
        ..strokeCap = StrokeCap.round
        ..strokeWidth = pointSize;

    canvas.drawPoints(PointMode.points, offsets, paint);
  }

  List<Offset> getCoordinates(List<double> points, Size size) {
    var coordinates = <Offset>[];

    // 좌표를 일정한 간격으로 벌려준다.
    var spacing = size.width / (points.length - 1);
    // 데이터 중 최소값 찾기
    var minY = points.reduce(min);
    // 데이터 중 최대값 찾기
    var maxY = points.reduce(max);
    // 텍스트가 들어갈 아래쪽 패딩 구하기
    var bottomPadding = fontSize * 2;
    // 텍스트가 들어갈 위쪽 패딩 구하기
    var topPadding = bottomPadding * 2;
    // 패딩을 제외한 화면의 높이 구하기.
    var h = size.height - topPadding;

    for(var index = 0 ; index < points.length ; index ++) {
      // x 축 좌표 구하기
      var x = spacing * index;
      // 정규화
      var normalizedY = points[index] / maxY;
      // y 축 좌표 구하기. 높이에 비례
      var y = getYPos(h, bottomPadding, normalizedY);

      var coord = Offset(x, y);
      coordinates.add(coord);

      findMinIndex(points, index, minY);
      findMaxIndex(points, index, maxY);
    }
    return coordinates;
  }

  double getYPos(double h, double bottomPadding, double normalizedY) =>
      (h + bottomPadding) - (normalizedY * h);

  void findMaxIndex(List<double> points, int index, double maxY) {
    if(maxY == points[index]) {
      maxValueIndex = index;
    }
  }

  void findMinIndex(List<double> points, int index, double minY) {
    if(minY == points[index]) {
      minValueIndex = index;
    }
  }

  void drawTextValue(Canvas canvas, String text, Offset pos, bool textUpward) {
    var maxSpan = TextSpan(
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      text: text
    );

    var tp = TextPainter(text: maxSpan, textDirection: TextDirection.ltr);

    tp.layout();
    // 텍스트의 방향을 고려해 y축 값을 보정
    var y = textUpward ? -tp.height * 1.5 : tp.height * 0.5;
    // 텍스트의 위치를 고려해 x축 값을 보정
    var dx = pos.dx - tp.width / 2;
    var dy = pos.dy + y;

    var offset = Offset(dx, dy);

    tp.paint(canvas, offset);
  }

  void drawText(Canvas canvas, List<Offset> offsets) {
    var minValue = points.reduce(min).toString();
    var maxValue = points.reduce(max).toString();

    drawTextValue(canvas, minValue, offsets[minValueIndex], false);
    drawTextValue(canvas, maxValue, offsets[maxValueIndex], true);
  }
}
