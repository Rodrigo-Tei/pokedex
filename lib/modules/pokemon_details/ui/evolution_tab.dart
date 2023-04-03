import 'package:flutter/material.dart';
import 'package:pokedex/models/evolution_chain.dart';

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

  List<Widget> _buildTileChain(
      List<Widget> chainList, EvolutionChain evolutionChain) {
    if (evolutionChain.chain.isNotEmpty) {
      chainList.add(
          Text('${evolutionChain.name} -> ${evolutionChain.chain[0].name}'));
      if (evolutionChain.chain[0].chain.isNotEmpty) {
        _buildTileChain(chainList, evolutionChain.chain[0]);
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
                  : Column(children: [
                      for (Widget widet
                          in _buildTileChain(chainList, evolutionChain!))
                        widet
                    ]),
            ),
          );
  }
}
