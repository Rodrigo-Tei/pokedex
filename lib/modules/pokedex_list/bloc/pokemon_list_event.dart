import 'package:equatable/equatable.dart';

abstract class PokemonListEvent extends Equatable {
  final List? _props;

  const PokemonListEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchPokemonList extends PokemonListEvent {
  final int pageIndex;
  FetchPokemonList(this.pageIndex) : super([pageIndex]);
}
