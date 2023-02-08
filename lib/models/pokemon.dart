import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Pokemon {
  Pokemon(this.name);

  final String name;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  @override
  String toString() {
    return 'Pokemon{name: $name }';
  }
}
