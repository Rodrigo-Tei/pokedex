import 'package:flutter/material.dart';
import 'package:pokedex/theme/colors.dart';

Color getColorFromType(String type) {
  switch (type) {
    case 'Normal':
      return DefaultTheme.types[Types.normal]!;
    case 'Fire':
      return DefaultTheme.types[Types.fire]!;
    case 'Water':
      return DefaultTheme.types[Types.water]!;
    case 'Electric':
      return DefaultTheme.types[Types.electric]!;
    case 'Grass':
      return DefaultTheme.types[Types.grass]!;
    case 'Ice':
      return DefaultTheme.types[Types.ice]!;
    case 'Fighting':
      return DefaultTheme.types[Types.fighting]!;
    case 'Poison':
      return DefaultTheme.types[Types.poison]!;
    case 'Ground':
      return DefaultTheme.types[Types.ground]!;
    case 'Flying':
      return DefaultTheme.types[Types.flying]!;
    case 'Psychic':
      return DefaultTheme.types[Types.psychic]!;
    case 'Bug':
      return DefaultTheme.types[Types.bug]!;
    case 'Rock':
      return DefaultTheme.types[Types.rock]!;
    case 'Ghost':
      return DefaultTheme.types[Types.ghost]!;
    case 'Dragon':
      return DefaultTheme.types[Types.dragon]!;
    case 'Dark':
      return DefaultTheme.types[Types.dark]!;
    case 'Steel':
      return DefaultTheme.types[Types.steel]!;
    case 'Fairy':
      return DefaultTheme.types[Types.fairy]!;
  }

  return DefaultTheme.grayscale[Grayscale.white]!;
}
