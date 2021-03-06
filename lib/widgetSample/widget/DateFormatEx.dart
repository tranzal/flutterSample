import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';


//https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html 데이트 포맷 상세설명
class DateFormatEx extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final time = DateTime.now();
    return Scaffold(
        appBar: AppBar(
          title: const Text('날짜 포맷'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(DateFormat.Hms('ko-KR').format(time))
            ],
          ),
        )
    );
  }
}