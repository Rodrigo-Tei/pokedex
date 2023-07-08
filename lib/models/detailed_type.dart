import 'package:json_annotation/json_annotation.dart';

part 'detailed_type.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DetailedType {
  DetailedType(this.name, this.damageRelationsTo, this.damageRelationsFrom);

  String name;
  Map<String, double> damageRelationsTo;
  Map<String, double> damageRelationsFrom;

  factory DetailedType.fromJson(Map<String, dynamic> json) =>
      _$DetailedTypeFromJson(json);

  Map<String, dynamic> toJson() => _$DetailedTypeToJson(this);

  @override
  String toString() {
    return '''DetailedType{name: $name, damageRelationsTo: $damageRelationsTo
    damageRelationsFrom: $damageRelationsFrom}''';
  }
}
