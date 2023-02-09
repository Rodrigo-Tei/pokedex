import 'package:flutter/material.dart';

enum Types {
  normal,
  fire,
  water,
  electric,
  grass,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dragon,
  dark,
  steel,
  fairy,
}

enum Grayscale {
  black,
  lightBlack,
  darkGray,
  gray,
  lightGray,
  lightestGray,
  white
}

class DefaultTheme {
  static const double colorOpacity = 0.08;

  static const Map<Types, Color> types = {
    Types.normal: Color(0xFFA8A77A),
    Types.fire: Color(0xFFEE8130),
    Types.water: Color(0xFF6390F0),
    Types.electric: Color(0xFFF7D02C),
    Types.grass: Color(0xFF7AC74C),
    Types.ice: Color(0xFF96D9D6),
    Types.fighting: Color(0xFFC22E28),
    Types.poison: Color(0xFFA33EA1),
    Types.ground: Color(0xFFE2BF65),
    Types.flying: Color(0xFFA98FF3),
    Types.psychic: Color(0xFFF95587),
    Types.bug: Color(0xFFA6B91A),
    Types.rock: Color(0xFFB6A136),
    Types.ghost: Color(0xFF735797),
    Types.dragon: Color(0xFF6F35FC),
    Types.dark: Color(0xFF705746),
    Types.steel: Color(0xFFB7B7CE),
    Types.fairy: Color(0xFFD685AD),
  };

  static const Map<Grayscale, Color> grayscale = {
    Grayscale.black: Color(0xFF1E2535),
    Grayscale.lightBlack: Color(0x8E1E2535),
    Grayscale.darkGray: Color(0xFF5D7186),
    Grayscale.gray: Color(0xFF9DA9B6),
    Grayscale.lightGray: Color(0xFFDDE5ED),
    Grayscale.lightestGray: Color(0xFFF4F7F9),
    Grayscale.white: Colors.white,
  };

  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: DefaultTheme.grayscale[Grayscale.white],
    backgroundColor: DefaultTheme.grayscale[Grayscale.white],
    fontFamily: 'Roboto',
  );
}
