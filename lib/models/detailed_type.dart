import 'package:json_annotation/json_annotation.dart';

part 'detailed_type.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonType {
  PokemonType(this.name, this.damageRelationsTo, this.damageRelationsFrom);

  String name;
  Map<String, double> damageRelationsTo;
  Map<String, double> damageRelationsFrom;

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);

  @override
  String toString() {
    return '''PokemonType{name: $name, damageRelationsTo: $damageRelationsTo
    damageRelationsFrom: $damageRelationsFrom}''';
  }
}
