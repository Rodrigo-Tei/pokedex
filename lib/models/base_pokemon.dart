import 'package:json_annotation/json_annotation.dart';

part 'base_pokemon.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BasePokemon {
  BasePokemon(this.name, this.url);

  String name;
  String url;

  factory BasePokemon.fromJson(Map<String, dynamic> json) =>
      _$BasePokemonFromJson(json);

  Map<String, dynamic> toJson() => _$BasePokemonToJson(this);

  @override
  String toString() {
    return 'BasePokemon{name: $name, url: $url}';
  }
}
