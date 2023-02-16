import 'package:flutter/material.dart';
import 'package:pokedex/theme/colors.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Shimmer.fromColors(
        baseColor: DefaultTheme.grayscale[Grayscale.lightGray]!,
        highlightColor: DefaultTheme.grayscale[Grayscale.lightestGray]!,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: DefaultTheme.grayscale[Grayscale.lightGray]!,
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
            color: DefaultTheme.grayscale[Grayscale.lightGray],
          ),
        ),
      ),
    );
  }
}
