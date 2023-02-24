import 'package:json_annotation/json_annotation.dart';

part 'pokemon_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PokemonDetails {
  PokemonDetails(this.genera, this.flavorText, this.genderRate, this.eggGroups);

  @JsonKey(name: 'genera', fromJson: _extractGenera)
  String genera;

  @JsonKey(name: 'flavor_text_entries', fromJson: _extractFlavorText)
  String flavorText;

  @JsonKey(name: 'egg_groups', fromJson: _extractEggGroups)
  List<String> eggGroups;

  int genderRate;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailsToJson(this);

  static String _extractGenera(List<dynamic> generaList) {
    String finalGenera = '';
    for (var genera in generaList) {
      if (genera["language"]["name"] == "en") {
        finalGenera = genera['genus'];
      }
    }
    return finalGenera;
  }

  static List<String> _extractEggGroups(List<dynamic> eggGroupsObject) {
    List<String> eggGroups = List.empty(growable: true);
    for (var group in eggGroupsObject) {
      eggGroups.add(group["name"]);
    }
    return eggGroups;
  }

  static String _extractFlavorText(List<dynamic> flavorTextList) {
    String finalFlavourText = '';
    for (var flavorText in flavorTextList) {
      if (flavorText["language"]["name"] == "en") {
        finalFlavourText = flavorText['flavor_text'];
        break;
      }
    }
    return finalFlavourText;
  }

  @override
  String toString() {
    return 'Pokemon{genera: $genera, flavorText: $flavorText}';
  }
}
