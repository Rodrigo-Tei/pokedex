import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/modules/pokedex/bloc/pokemon_list_event.dart';
import 'package:pokedex/modules/pokedex/bloc/pokemon_list_state.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonRepository pokemonRepository;
  int pageIndex = 0;

  List<Pokemon> _pokemonList = List.empty();

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

  PokemonListBloc(this.pokemonRepository) : super(PokemonListFirstLoading()) {
    on<FetchPokemonList>((event, emit) async {
      event.pageIndex == 0
          ? emit(PokemonListFirstLoading())
          : emit(PokemonNewListLoading());
      List<Pokemon> tmpPokemonList = List.empty();
      pageIndex = event.pageIndex;
      tmpPokemonList = await pokemonRepository.getUserPokemons(pageIndex);
      _pokemonList += tmpPokemonList;
      for (Pokemon pokemon in _pokemonList) {
        handlePokemonStrings(pokemon);
      }
      emit(PokemonListLoaded(_pokemonList));
    });
  }
}
