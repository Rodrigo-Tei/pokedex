import 'package:flutter/material.dart';
import 'package:pokedex/theme/colors.dart';

class TypeTag extends StatelessWidget {
  final String type;

  const TypeTag({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.0,
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
        color: DefaultTheme.grayscale[Grayscale.white]!.withOpacity(0.2),
      ),
      child: Text(
        type,
        style: TextStyle(
            color: DefaultTheme.grayscale[Grayscale.white],
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
