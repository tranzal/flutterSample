import 'package:hive/hive.dart';

part 'TypeAdapter.g.dart';
/*
  build_runner를 이용하여 타입을 연결시킬 파일인 TypeAdapter.g.dart를 생성한다.

  생성방법은 flutter packages run build_runner build 를 입력하면 된다.
 */
@HiveType(typeId:1)
class SampleModel{
  @HiveField(0)
  final String title;

  SampleModel({required this.title});
}