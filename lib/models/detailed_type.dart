import 'package:json_annotation/json_annotation.dart';

part 'detailed_type.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DetailedType {
  DetailedType(
    this.name,
    this.noDamageTo,
    this.halfDamageTo,
    this.singleDamageTo,
    this.doubleDamageTo,
    this.noDamageFrom,
    this.halfDamageFrom,
    this.singleDamageFrom,
    this.doubleDamageFrom,
  );

  String name;
  List<Map<String, double>> noDamageTo;
  List<Map<String, double>> halfDamageTo;
  List<Map<String, double>> singleDamageTo;
  List<Map<String, double>> doubleDamageTo;
  List<Map<String, double>> noDamageFrom;
  List<Map<String, double>> halfDamageFrom;
  List<Map<String, double>> singleDamageFrom;
  List<Map<String, double>> doubleDamageFrom;

  factory DetailedType.fromJson(Map<String, dynamic> json) =>
      _$DetailedTypeFromJson(json);

  Map<String, dynamic> toJson() => _$DetailedTypeToJson(this);

  @override
  String toString() {
    return '''DetailedType{name: $name, noDamageTo: $noDamageTo, 
    halfDamageTo: $halfDamageTo, singleDamageTo: $singleDamageTo, 
    doubleDamageTo: $doubleDamageTo, noDamageFrom: $noDamageFrom
    halfDamageFrom: $halfDamageFrom, singleDamageFrom: $singleDamageFrom
    doubleDamageFrom: $doubleDamageFrom}''';
  }
}
