import 'package:pokedex/models/pokemon.dart';

String capitalizeFirstLetter(String word) {
  return word[0].toUpperCase() + word.substring(1);
}

String undoCapitalizeFirstLetter(String word) {
  return word[0].toLowerCase() + word.substring(1);
}

String capitalizeEveryFirstLetter(String word) {
  String finalWord = '';
  List<String> wordInList = word.split('-');
  for (String word in wordInList) {
    finalWord += '${capitalizeFirstLetter(word)} ';
  }
  return finalWord;
}

String splitPokemonName(String name) {
  if (name.contains('jr')) {
    name = "${name.split('-')[0]} Jr.";
  }
  switch (name) {
    case 'Mr-mime':
      return 'Mr. Mime';
    case 'Ho-oh':
      return name;
    case 'Porygon-Z':
      return name;
    default:
      return name.split('-')[0];
  }
}

void handlePokemonStrings(Pokemon pokemon) {
  pokemon.name = capitalizeFirstLetter(pokemon.name);
  if (pokemon.name.contains('-')) {
    pokemon.name = splitPokemonName(pokemon.name);
  }
  for (int i = 0; i < pokemon.types.length; i++) {
    pokemon.types[i] = capitalizeFirstLetter(pokemon.types[i]);
  }
  for (int i = 0; i < pokemon.moves.length; i++) {
    pokemon.moves[i].name = capitalizeEveryFirstLetter(pokemon.moves[i].name);
  }
}

String handleLineBreak(String text) {
  String newText;

  newText = text.replaceAll("\n", " ");
  newText = newText.replaceAll("", " ");

  return newText;
}

String handleStatName(String stat) {
  switch (stat) {
    case "hp":
      return "HP";
    case "attack":
      return "Attack";
    case "defense":
      return "Defense";
    case "special-attack":
      return "Sp. Atk";
    case "special-defense":
      return "Sp. Def";
    case "speed":
      return "Speed";
  }
  return "";
}
