import 'package:equatable/equatable.dart';
import 'package:pokedex/models/pokemon.dart';

abstract class PokemonListState extends Equatable {
  final List _props;

  const PokemonListState(this._props);

  @override
  List get props => _props;
}

class PokemonListLoading extends PokemonListState {
  PokemonListLoading() : super([]);

  @override
  String toString() => 'PokemonListLoading';
}

class PokemonListLoaded extends PokemonListState {
  final List<Pokemon> pokemonList;
  PokemonListLoaded(this.pokemonList) : super([pokemonList]);

  @override
  String toString() => 'PokemonListLoaded';
}
