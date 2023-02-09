import 'package:flutter/material.dart';
import 'package:pokedex/theme/colors.dart';

Color getColorFromType(String type) {
  switch (type) {
    case 'normal':
      return DefaultTheme.types[Types.normal]!;
    case 'fire':
      return DefaultTheme.types[Types.fire]!;
    case 'water':
      return DefaultTheme.types[Types.water]!;
    case 'electric':
      return DefaultTheme.types[Types.electric]!;
    case 'grass':
      return DefaultTheme.types[Types.grass]!;
    case 'ice':
      return DefaultTheme.types[Types.ice]!;
    case 'fighting':
      return DefaultTheme.types[Types.fighting]!;
    case 'poison':
      return DefaultTheme.types[Types.poison]!;
    case 'ground':
      return DefaultTheme.types[Types.ground]!;
    case 'flying':
      return DefaultTheme.types[Types.flying]!;
    case 'psychic':
      return DefaultTheme.types[Types.psychic]!;
    case 'bug':
      return DefaultTheme.types[Types.bug]!;
    case 'rock':
      return DefaultTheme.types[Types.rock]!;
    case 'ghost':
      return DefaultTheme.types[Types.ghost]!;
    case 'dragon':
      return DefaultTheme.types[Types.dragon]!;
    case 'dark':
      return DefaultTheme.types[Types.dark]!;
    case 'steel':
      return DefaultTheme.types[Types.steel]!;
    case 'fairy':
      return DefaultTheme.types[Types.fairy]!;
  }

  return DefaultTheme.grayscale[Grayscale.white]!;
}
