String buildPokemonNumber(int number) {
  return '#${number.toString().padLeft(4, '0')}';
}
