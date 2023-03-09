import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/helpers/pokemon_strings_helper.dart';
import 'package:pokedex/models/detailed_type.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/modules/pokedex_list/bloc/pokemon_list_event.dart';
import 'package:pokedex/modules/pokedex_list/bloc/pokemon_list_state.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';
import 'package:pokedex/constants.dart' as constants;

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonRepository pokemonRepository;
  int pageIndex = 0;

  List<Pokemon> _pokemonList = List.empty();

  Map<String, double> buildTypeEffectiveness(List<PokemonType> types) {
    late Map<String, double> definitiveDamageRelationsFrom = {};

    for (String singleType in constants.types) {
      for (int i = 0; i < types.length; i++) {
        if (!types[i].damageRelationsFrom.containsKey(singleType)) {
          types[i].damageRelationsFrom.addAll({singleType: 1.0});
        }
      }
    }

    for (String singleType in constants.types) {
      if (types.length == 1) {
        definitiveDamageRelationsFrom.addAll(types[0].damageRelationsFrom);
      } else {
        final Map<String, double> newType = {
          singleType: types[0].damageRelationsFrom[singleType]! *
              types[1].damageRelationsFrom[singleType]!
        };
        definitiveDamageRelationsFrom.addAll(newType);
      }
    }

    return definitiveDamageRelationsFrom;
  }

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
        pokemon.typeEffectiveness = buildTypeEffectiveness(pokemon.types!);
      }
      emit(PokemonListLoaded(_pokemonList));
    });
  }
}
