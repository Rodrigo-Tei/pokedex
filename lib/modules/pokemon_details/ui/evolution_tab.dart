import 'package:flutter/material.dart';
import 'package:pokedex/helpers/pokemon_strings_helper.dart';
import 'package:pokedex/models/evolution_chain.dart';
import 'package:pokedex/models/evolution_details.dart';

class EvolutionTab extends StatelessWidget {
  //TODO: CHANGE TO STATEFUL
  final EvolutionChain? evolutionChain;
  final bool loading;

  const EvolutionTab({
    required this.evolutionChain,
    required this.loading,
    Key? key,
  }) : super(key: key);

  Widget _buildPlaceholder() {
    //TODO: create placeholder
    return Text('ESSE BICHO NUM EVOLUI');
  }

  Widget _buildTile(
      EvolutionChain evolutionChain1, EvolutionChain evolutionChain2) {
    // return Text('${evolutionChain1.name} -> ${evolutionChain2.name}');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            SizedBox(
              width: 60,
              child: evolutionChain1.pokemon?.image!,
            ),
            Text(capitalizeFirstLetter(evolutionChain1.name)),
          ],
        ),
        Icon(Icons.arrow_forward_rounded),
        Column(
          children: [
            SizedBox(
              width: 60,
              child: evolutionChain2.pokemon?.image!,
            ),
            Text(capitalizeFirstLetter(evolutionChain2.name)),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildTileChain(
      List<Widget> chainList, EvolutionChain evolutionChain) {
    if (evolutionChain.chain.isNotEmpty) {
      for (EvolutionChain evolution in evolutionChain.chain) {
        chainList.add(_buildTile(evolutionChain, evolution));
        if (evolution.chain.isNotEmpty) {
          _buildTileChain(chainList, evolution);
        }
      }
    }
    return chainList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> chainList = List.empty(growable: true);
    return loading
        ? Container()
        : Container(
            margin: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: evolutionChain!.chain.isEmpty
                  ? _buildPlaceholder()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Evolution Chain',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Column(
                          children: [
                            for (Widget tile
                                in _buildTileChain(chainList, evolutionChain!))
                              tile
                          ],
                        ),
                      ],
                    ),
            ),
          );
  }
}
