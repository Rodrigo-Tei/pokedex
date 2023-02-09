import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/modules/pokedex/bloc/pokemon_list_event.dart';
import 'package:pokedex/modules/pokedex/bloc/pokemon_list_state.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonRepository pokemonRepository;

  List<Pokemon> _pokemonList = List.empty();

  String capitalizeFirstLetter(String word) {
    return word[0].toUpperCase() + word.substring(1);
  }

  PokemonListBloc(this.pokemonRepository) : super(PokemonListLoading()) {
    on<FetchPokemonList>((event, emit) async {
      emit(PokemonListLoading());
      _pokemonList = await pokemonRepository.getUserPokemons();
      for (Pokemon pokemon in _pokemonList) {
        pokemon.name = capitalizeFirstLetter(pokemon.name);
        for (int i = 0; i < pokemon.types.length; i++) {
          pokemon.types[i] = capitalizeFirstLetter(pokemon.types[i]);
        }
      }
      emit(PokemonListLoaded(_pokemonList));
    });
  }
}
