import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/helpers/pokemon_strings_helper.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/modules/pokedex_list/bloc/pokemon_list_event.dart';
import 'package:pokedex/modules/pokedex_list/bloc/pokemon_list_state.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonRepository pokemonRepository;
  int pageIndex = 0;

  List<Pokemon> _pokemonList = List.empty();

  PokemonListBloc(this.pokemonRepository) : super(PokemonListFirstLoading()) {
    on<FetchPokemonList>((event, emit) async {
      event.pageIndex == 0
          ? emit(PokemonListFirstLoading())
          : emit(PokemonNewListLoading());
      List<Pokemon> tmpPokemonList = List.empty();
      pageIndex = event.pageIndex;
      tmpPokemonList = await pokemonRepository.getPokemons(pageIndex);
      _pokemonList += tmpPokemonList;
      for (Pokemon pokemon in _pokemonList) {
        handlePokemonStrings(pokemon);
      }
      emit(PokemonListLoaded(_pokemonList));
    });
  }
}
