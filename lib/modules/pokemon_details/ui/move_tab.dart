import 'package:flutter/material.dart';
import 'package:pokedex/models/move.dart';
import 'package:pokedex/models/pokemon.dart';

class MoveTab extends StatelessWidget {
  final bool loading;
  final Pokemon pokemon;

  const MoveTab({
    Key? key,
    required this.loading,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            for (Move move in pokemon.moves)
              TableRow(
                children: [
                  Text(move.name),
                  Text(move.moveDetails.learnedMethod),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
