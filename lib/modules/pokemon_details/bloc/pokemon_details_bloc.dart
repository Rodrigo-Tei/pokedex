import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/helpers/build_pokemon_number.dart';
import 'package:pokedex/helpers/pokemon_strings_helper.dart';
import 'package:pokedex/models/detailed_type.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/modules/pokemon_details/bloc/pokemon_details_event.dart';
import 'package:pokedex/modules/pokemon_details/bloc/pokemon_details_state.dart';
import 'package:pokedex/repositories/pokemon_details_repository.dart';
import 'package:pokedex/constants.dart' as constants;

class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  final PokemonDetailsRepository pokemonDetailsRepository;

  Map<String, double> buildTypeEffectiveness(List<DetailedType> types) {
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

  PokemonDetailsBloc(this.pokemonDetailsRepository)
      : super(PokemonDetailsLoading()) {
    on<FetchPokemonDetails>((event, emit) async {
      emit(PokemonDetailsLoading());
      PokemonDetails pokemonDetails =
          await pokemonDetailsRepository.getPokemonDetails(event.pokemon);
      for (int i = 0; i < pokemonDetails.eggGroups.length; i++) {
        pokemonDetails.eggGroups[i] =
            capitalizeFirstLetter(pokemonDetails.eggGroups[i]);
      }
      pokemonDetails.hatchCounter =
          buildHatchCounter(pokemonDetails.hatchCounter);
      pokemonDetails.typeEffectiveness =
          buildTypeEffectiveness(pokemonDetails.detailedTypes!);
      emit(PokemonDetailsLoaded(pokemonDetails));
    });
  }
}
