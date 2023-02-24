import 'package:pokedex/models/pokemon.dart';

String capitalizeFirstLetter(String word) {
  return word[0].toUpperCase() + word.substring(1);
}

String splitPokemonName(String name) {
  return name.split('-')[0];
}

void handlePokemonStrings(Pokemon pokemon) {
  pokemon.name = capitalizeFirstLetter(pokemon.name);
  if (pokemon.name.contains('-')) {
    pokemon.name = splitPokemonName(pokemon.name);
  }
  for (int i = 0; i < pokemon.types.length; i++) {
    pokemon.types[i] = capitalizeFirstLetter(pokemon.types[i]);
  }
}
