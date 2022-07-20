import 'package:json_annotation/json_annotation.dart';

part 'sample_model.g.dart';

@JsonSerializable(checked: true, createFactory: true, fieldRename: FieldRename.none)
class SampleModel {
  String id;
  String pw;

  SampleModel({required this.id, required this.pw});

  factory SampleModel.fromJson(Map<String, dynamic> json) => _$SampleModelFromJson(json);
  Map<String, dynamic> toJson() => _$SampleModelToJson(this);
}