import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/modules/pokedex/bloc/pokemon_list_bloc.dart';
import 'package:pokedex/modules/pokedex/bloc/pokemon_list_event.dart';
import 'package:pokedex/modules/pokedex/bloc/pokemon_list_state.dart';
import 'package:pokedex/modules/pokedex/ui/pokemon_card.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key, required this.title});

  final String title;

  @override
  State<PokemonList> createState() => _PokemonListState();
}

@override
class _PokemonListState extends State<PokemonList> {
  late PokemonListBloc _pokemonListBloc;
  List<Pokemon> pokemonList = List.empty();

  @override
  void initState() {
    super.initState();
    _pokemonListBloc = context.read<PokemonListBloc>();
    _pokemonListBloc.add(FetchPokemonList());
  }

  Future<void> _handleListener(
      BuildContext context, PokemonListState state) async {
    if (state is PokemonListLoaded) {
      pokemonList = state.pokemonList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokemonListBloc, PokemonListState>(
      bloc: _pokemonListBloc,
      listener: _handleListener,
      builder: (BuildContext context, PokemonListState state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2.5 / 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12),
              itemCount: pokemonList.length,
              itemBuilder: (BuildContext ctx, index) {
                return PokemonCard(
                  pokemon: pokemonList[index],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
