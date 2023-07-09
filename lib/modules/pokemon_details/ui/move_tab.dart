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

  int _getItemCount() {
    return pokemon.moves.length + 4;
  }

  Widget _rowBuilder(context, i) {
    return Container(
      child: Row(
        children: [
          Text('${pokemon.moves[i].name} aaaaa'),
          Text(pokemon.moves[i].moveDetails.learnedMethod),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        // margin: const EdgeInsets.all(24.0),
        // child: SingleChildScrollView(
        // child: Table(
        //   defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        //   children: [
        //     for (Move move in pokemon.moves)
        //       TableRow(
        // children: [
        //   Text(move.name),
        //   Text(move.moveDetails.learnedMethod),
        // ],
        //       ),
        //   ],
        // ),
        children: [
          Expanded(
            child: ListView(
              // scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: _getItemCount(),
                    itemBuilder: _rowBuilder)
              ],
            ),
          )
        ]
        // ),
        );
  }
}
