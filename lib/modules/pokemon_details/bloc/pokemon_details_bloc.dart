import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/helpers/build_pokemon_number.dart';
import 'package:pokedex/helpers/pokemon_strings_helper.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/modules/pokemon_details/bloc/pokemon_details_event.dart';
import 'package:pokedex/modules/pokemon_details/bloc/pokemon_details_state.dart';
import 'package:pokedex/repositories/pokemon_details_repository.dart';

class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  final PokemonDetailsRepository pokemonDetailsRepository;

  PokemonDetailsBloc(this.pokemonDetailsRepository)
      : super(PokemonDetailsLoading()) {
    on<FetchPokemonDetails>((event, emit) async {
      emit(PokemonDetailsLoading());
      PokemonDetails pokemonDetails =
          await pokemonDetailsRepository.getPokemonDetails(event.pokedexNumber);
      for (int i = 0; i < pokemonDetails.eggGroups.length; i++) {
        pokemonDetails.eggGroups[i] =
            capitalizeFirstLetter(pokemonDetails.eggGroups[i]);
      }
      pokemonDetails.hatchCounter =
          buildHatchCounter(pokemonDetails.hatchCounter);
      emit(PokemonDetailsLoaded(pokemonDetails));
    });
  }
}
