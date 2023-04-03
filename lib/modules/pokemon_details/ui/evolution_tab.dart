import 'package:flutter/material.dart';
import 'package:pokedex/helpers/pokemon_strings_helper.dart';
import 'package:pokedex/models/evolution_chain.dart';
import 'package:pokedex/models/evolution_details.dart';

class EvolutionTab extends StatelessWidget {
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

  Widget _buildTile(evolutionChain1, evolutionChain2) {
    // return Text('${evolutionChain1.name} -> ${evolutionChain2.name}');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(capitalizeFirstLetter(evolutionChain1.name)),
        Icon(Icons.arrow_forward_rounded),
        Text(capitalizeFirstLetter(evolutionChain2.name)),
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
                      children: [
                        for (Widget widet
                            in _buildTileChain(chainList, evolutionChain!))
                          widet
                      ],
                    ),
            ),
          );
  }
}
