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
    return pokemon.moves.length;
  }

  bool _learnedMethodHasChanged(Move move1, Move move2, int i) {
    return move1.moveDetails.learnedMethod != move2.moveDetails.learnedMethod;
  }

  String _buildTitle(String input) {
    //TODO: TURN THIS INTO ENUM ON MODEL
    switch (input) {
      case 'level-up':
        return 'By Level';
      case 'egg':
        return 'By Egg';
      case 'machine':
        return 'By TM';
      case 'tutor':
        return 'By Tutor';
    }

    return '';
  }

  Widget _buildLearnedMethod(Move move) {
    switch (move.moveDetails.learnedMethod) {
      case 'level-up':
        return Text('Level ${move.moveDetails.levelLearnedAt}');
      case 'egg':
        return const Text('Egg');
      case 'machine':
        return const Text('TM');
      case 'tutor':
        return const Text('Tutor');
    }
    return Container();
  }

  Widget _rowBuilder(context, i) {
    //TODO: IMPROVE THIS BUILDER. MAYBE SEPARATE INTO 4 DIFFERENT LISTS BY TYPE
    return i == 0
        ? Column(children: [
            Text(
              _buildTitle(pokemon.moves[i + 1].moveDetails.learnedMethod),
              style: const TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${pokemon.moves[i].name} + $i',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                _buildLearnedMethod(pokemon.moves[i]),
              ],
            ),
          ])
        : _learnedMethodHasChanged(pokemon.moves[i], pokemon.moves[i - 1], i)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    _buildTitle(pokemon.moves[i + 1].moveDetails.learnedMethod),
                    style: const TextStyle(fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${pokemon.moves[i].name} + $i',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      _buildLearnedMethod(pokemon.moves[i]),
                    ],
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${pokemon.moves[i].name} + $i',
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  _buildLearnedMethod(pokemon.moves[i]),
                ],
              );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _getItemCount(),
              itemBuilder: _rowBuilder,
            ),
          ),
        ],
      ),
    );
  }
}
