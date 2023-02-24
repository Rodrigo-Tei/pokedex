// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/modules/pokedex_list/bloc/pokemon_list_bloc.dart';
import 'package:pokedex/modules/pokemon_details/bloc/pokemon_details_bloc.dart';
import 'package:pokedex/repositories/pokemon_details_repository.dart';
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
        BlocProvider(
          create: (context) => PokemonDetailsBloc(
            PokemonDetailsRepository(),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
