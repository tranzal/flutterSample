import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


/*
  !는 null 사용 불가 처리
  ?는 해당 객체가 null이면 null을 반환하고 아니라면 해당 타입 또는 속성을 사용 ?가 없으면 null 사용 불가
  ?? null인지 체크 후 null일 경우 뒤에오는 값을 대신 출력한다.
  ??= null 값이 오면 = 뒤에 오는 값을 변수에 할당한다.
  late null을 사용하지 않지만 초기화를 나중에 할때 사용
 */
class IfNullOperationEx extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String? text = null;
    return Scaffold(
        appBar: AppBar(
          title: const Text('! ? 뭔지'),
        ),
        body: Center(
          child: Text(text?? ""),
        )
    );
  }
}