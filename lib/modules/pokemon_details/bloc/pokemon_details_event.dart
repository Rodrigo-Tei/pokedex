import 'package:equatable/equatable.dart';

abstract class PokemonDetailsEvent extends Equatable {
  final List? _props;

  const PokemonDetailsEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchPokemonDetails extends PokemonDetailsEvent {
  final int pokedexNumber;
  FetchPokemonDetails(this.pokedexNumber) : super([pokedexNumber]);
}
