String buildPokemonNumber(int number) {
  return '#${number.toString().padLeft(4, '0')}';
}

double hectogramToKilogram(int hectogram) {
  return (hectogram / 10).toDouble();
}

double decimeterToMeter(int decimeter) {
  return (decimeter / 10).toDouble();
}

double convertGenderRate(int genderRate) {
  return genderRate * 12.5;
}

int buildHatchCounter(int hatchCounter) {
  return hatchCounter * 257;
}

double setStatPercentage(int statValue) {
  return statValue / 255;
}
