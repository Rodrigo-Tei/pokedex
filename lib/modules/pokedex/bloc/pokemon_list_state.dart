import 'package:equatable/equatable.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_details.dart';

abstract class PokemonListState extends Equatable {
  final List _props;

  const PokemonListState(this._props);

  @override
  List get props => _props;
}

class PokemonListFirstLoading extends PokemonListState {
  PokemonListFirstLoading() : super([]);

  @override
  String toString() => 'PokemonListFirstLoading';
}

class PokemonNewListLoading extends PokemonListState {
  PokemonNewListLoading() : super([]);

  @override
  String toString() => 'PokemonNewListLoading';
}

class PokemonListLoaded extends PokemonListState {
  final List<Pokemon> pokemonList;
  PokemonListLoaded(this.pokemonList) : super([pokemonList]);

  @override
  String toString() => 'PokemonListLoaded';
}

class PokemonDetailsLoading extends PokemonListState {
  PokemonDetailsLoading() : super([]);

  @override
  String toString() => 'PokemonDetailsLoading';
}

class PokemonDetailsLoaded extends PokemonListState {
  final PokemonDetails pokemonDetails;
  PokemonDetailsLoaded(this.pokemonDetails) : super([pokemonDetails]);

  @override
  String toString() => 'PokemonDetailsLoaded';
}
