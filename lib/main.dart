// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/modules/pokedex/bloc/pokemon_list_bloc.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => PokemonListBloc(
            PokemonRepository(),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
