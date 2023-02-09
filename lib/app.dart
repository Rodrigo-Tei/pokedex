import 'package:flutter/material.dart';
import 'package:pokedex/modules/pokedex/ui/pokemon_list.dart';
import 'package:pokedex/theme/colors.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DefaultTheme.theme,
      home: const PokemonList(title: 'Pokédex'),
    );
  }
}
