import 'package:flutter/material.dart';
import 'package:pokedex/helpers/build_pokemon_number.dart';
import 'package:pokedex/helpers/color_helper.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/modules/commons/type_tag.dart';
import 'package:pokedex/theme/colors.dart';
import 'package:shimmer/shimmer.dart';

class AboutTab extends StatelessWidget {
  final bool loading;
  final Pokemon pokemon;
  final PokemonDetails pokemonDetails;

  const AboutTab({
    Key? key,
    required this.loading,
    required this.pokemon,
    required this.pokemonDetails,
  }) : super(key: key);

  static const rowSpacer = TableRow(children: [
    SizedBox(
      height: 4.0,
    ),
    SizedBox(
      height: 4.0,
    )
  ]);

  Widget _buildSmallTextShimmer() {
    return Shimmer.fromColors(
      baseColor: DefaultTheme.grayscale[Grayscale.lightGray]!,
      highlightColor: DefaultTheme.grayscale[Grayscale.lightestGray]!,
      child: Container(
        decoration: BoxDecoration(
          color: DefaultTheme.grayscale[Grayscale.lightGray],
          borderRadius: const BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        width: 48,
        height: 16,
      ),
    );
  }

  Widget _buildBigTextShimmer(context) {
    return Shimmer.fromColors(
      baseColor: DefaultTheme.grayscale[Grayscale.lightGray]!,
      highlightColor: DefaultTheme.grayscale[Grayscale.lightestGray]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: DefaultTheme.grayscale[Grayscale.lightGray],
              borderRadius: const BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            width: double.infinity,
            height: 16,
          ),
          const SizedBox(height: 4.0),
          Container(
            decoration: BoxDecoration(
              color: DefaultTheme.grayscale[Grayscale.lightGray],
              borderRadius: const BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            width: double.infinity,
            height: 16,
          ),
          const SizedBox(height: 4.0),
          Container(
            decoration: BoxDecoration(
              color: DefaultTheme.grayscale[Grayscale.lightGray],
              borderRadius: const BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            width: MediaQuery.of(context).size.width / 2,
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildWeightAndHeight(String title, String value) {
    String unit = title == 'Height' ? 'm' : 'Kg';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: DefaultTheme.grayscale[Grayscale.gray],
          ),
        ),
        const SizedBox(
          height: 4.0,
        ),
        loading
            ? _buildSmallTextShimmer()
            : Text(
                "$value$unit",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: DefaultTheme.grayscale[Grayscale.black],
                ),
              ),
      ],
    );
  }

  Widget _buildWeightAndHeightCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        color: DefaultTheme.grayscale[Grayscale.white],
        boxShadow: [
          BoxShadow(
            color: DefaultTheme.grayscale[Grayscale.lightGray]!,
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildWeightAndHeight(
              "Height", decimeterToMeter(pokemon.height).toString()),
          const SizedBox(width: 12.0),
          _buildWeightAndHeight(
              "Weight", hectogramToKilogram(pokemon.weight).toString()),
        ],
      ),
    );
  }

  Widget _buildFlavourText(context) {
    return loading
        ? _buildBigTextShimmer(context)
        : Text(
            pokemonDetails.flavorText,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          );
  }

  Widget _buildBreedingDetails() {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Breeding",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 16.0),
          Table(
            children: [
              TableRow(
                children: [
                  Text(
                    "Gender",
                    style: TextStyle(
                        color: DefaultTheme.grayscale[Grayscale.gray],
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                  ),
                  pokemonDetails.genderRate == -1
                      ? const Text("Gender unknown")
                      : Row(
                          children: [
                            SizedBox(
                              width: 80.0,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.male,
                                    color: getColorFromType("Water"),
                                  ),
                                  loading
                                      ? _buildSmallTextShimmer()
                                      : Text(
                                          "${(100 - convertGenderRate(pokemonDetails.genderRate)).toString()}%"),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            SizedBox(
                              width: 80.0,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.female,
                                    color: getColorFromType("Psychic"),
                                  ),
                                  loading
                                      ? _buildSmallTextShimmer()
                                      : Text(
                                          "${convertGenderRate(pokemonDetails.genderRate).toString()}%")
                                ],
                              ),
                            )
                          ],
                        ),
                ],
              ),
              rowSpacer,
              TableRow(
                children: [
                  Text(
                    "Egg Groups",
                    style: TextStyle(
                        color: DefaultTheme.grayscale[Grayscale.gray],
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                  ),
                  loading
                      ? _buildSmallTextShimmer()
                      : Row(
                          children: [
                            for (var eggGroup in pokemonDetails.eggGroups)
                              Tag(
                                text: eggGroup,
                                isEggGroup: true,
                              ),
                          ],
                        ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          _buildFlavourText(context),
          _buildWeightAndHeightCard(),
          _buildBreedingDetails(),
        ],
      ),
    );
  }
}
