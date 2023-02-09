import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Pokemon {
  Pokemon(this.name, this.types);

  String name;
  @JsonKey(name: 'types', fromJson: _extractPokemonTypes)
  List<String> types;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  static List<String> _extractPokemonTypes(List<dynamic> types) {
    List<String> pokemonTypes = List.empty(growable: true);
    for (var type in types) {
      pokemonTypes.add(type["type"]["name"]);
    }
    return pokemonTypes;
  }

  @override
  String toString() {
    return 'Pokemon{name: $name, types: $types}';
  }
}
