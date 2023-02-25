import 'package:flutter/material.dart';
import 'package:pokedex/theme/colors.dart';

class Tag extends StatelessWidget {
  final String text;
  final bool? isEggGroup;

  const Tag({
    Key? key,
    required this.text,
    this.isEggGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isEggGroup == true ? 80.0 : 75.0,
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
        color: isEggGroup == true
            ? DefaultTheme.grayscale[Grayscale.gray]!.withOpacity(0.2)
            : DefaultTheme.grayscale[Grayscale.white]!.withOpacity(0.2),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isEggGroup == true
                ? DefaultTheme.grayscale[Grayscale.black]
                : DefaultTheme.grayscale[Grayscale.white],
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
