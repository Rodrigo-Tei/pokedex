import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/modules/pokedex/bloc/pokemon_list_event.dart';
import 'package:pokedex/modules/pokedex/bloc/pokemon_list_state.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonRepository pokemonRepository;

  List<Pokemon> _pokemonList = List.empty();

  PokemonListBloc(this.pokemonRepository) : super(PokemonListLoading()) {
    on<FetchPokemonList>((event, emit) async {
      emit(PokemonListLoading());
      _pokemonList = await pokemonRepository.getUserPokemons();
      emit(PokemonListLoaded(_pokemonList));
    });
  }
}
