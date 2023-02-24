import 'package:equatable/equatable.dart';
import 'package:pokedex/models/pokemon_details.dart';

abstract class PokemonDetailsState extends Equatable {
  final List _props;

  const PokemonDetailsState(this._props);

  @override
  List get props => _props;
}

class PokemonDetailsLoading extends PokemonDetailsState {
  PokemonDetailsLoading() : super([]);

  @override
  String toString() => 'PokemonDetailsLoading';
}

class PokemonDetailsLoaded extends PokemonDetailsState {
  final PokemonDetails pokemonDetails;
  PokemonDetailsLoaded(this.pokemonDetails) : super([pokemonDetails]);

  @override
  String toString() => 'PokemonDetailsLoaded';
}
