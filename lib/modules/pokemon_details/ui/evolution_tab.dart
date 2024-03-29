import 'package:flutter/material.dart';
import 'package:pokedex/helpers/pokemon_strings_helper.dart';
import 'package:pokedex/models/evolution_chain.dart';
import 'package:pokedex/models/evolution_details.dart';
import 'package:pokedex/theme/colors.dart';

class EvolutionTab extends StatefulWidget {
  const EvolutionTab({
    required this.evolutionChain,
    required this.loading,
    Key? key,
  }) : super(key: key);

  final EvolutionChain? evolutionChain;
  final bool loading;

  @override
  State<EvolutionTab> createState() => _EvolutionTabState();
}

@override
class _EvolutionTabState extends State<EvolutionTab> {
  EvolutionChain? get evolutionChain => widget.evolutionChain;
  bool get loading => widget.loading;

  static const rowSpacer = TableRow(children: [
    SizedBox(
      height: 12.0,
    ),
    SizedBox(
      height: 12.0,
    ),
    SizedBox(
      height: 12.0,
    )
  ]);

  Widget _buildPlaceholder() {
    //TODO: create placeholder
    return const Text('ESSE BICHO NUM EVOLUI');
  }

  List<Widget> _buildEvolutionContidions(EvolutionDetails conditions) {
    late List<Widget> conditionList = List.empty(growable: true);
    if (conditions.gender != null) {
      if (conditions.gender == 0) {
        conditionList.add(const Text('male')); //TODO CHANGE TO ICON
      } else {
        conditionList.add(const Text('female'));
      }
    }
    if (conditions.heldItem != null) {
      conditionList
          .add(SizedBox(width: 24.0, child: conditions.heldItem!.image));
    }
    if (conditions.item != null) {
      conditionList.add(SizedBox(width: 24.0, child: conditions.item!.image));
    }
    if (conditions.knownMove != null) {
      conditionList.add(Text('Must know ${conditions.knownMove!}'));
    }
    if (conditions.knownMoveType != null) {
      conditionList.add(Text('Move Type ${conditions.knownMoveType!}'));
    }
    if (conditions.location != null) {
      conditionList.add(Text(conditions.location!));
    }
    if (conditions.minAffection != null) {
      conditionList.add(const Text('Affection'));
    }
    if (conditions.minBeauty != null) {
      conditionList.add(const Text('Beauty'));
    }
    if (conditions.minHappiness != null) {
      conditionList.add(const Text('Happiness'));
    }
    if (conditions.minLevel != null) {
      conditionList.add(Text('Level ${conditions.minLevel!.toString()}'));
    }
    if (conditions.needsOverworldRain == true) {
      conditionList.add(Text(conditions.needsOverworldRain!.toString()));
    }
    if (conditions.partySpecies != null) {
      conditionList.add(Text(conditions.partySpecies!));
    }
    if (conditions.partyType != null) {
      conditionList.add(Text('Party type ${conditions.partyType!}'));
    }
    if (conditions.relativePhysicalStats != null) {
      conditionList.add(Text(conditions.relativePhysicalStats!.toString()));
    }
    if (conditions.timeOfDay != null && conditions.timeOfDay != '') {
      conditionList.add(Text(conditions.timeOfDay!));
    }
    if (conditions.tradeSpecies != null) {
      conditionList.add(Text(conditions.tradeSpecies!));
    }
    if (conditions.trigger == 'trade') {
      conditionList.add(const Text('Trade')); //TODO: CHANGE TO ICON
    }
    return conditionList;
  }

  TableRow _buildRow(
      EvolutionChain evolutionChain1, EvolutionChain evolutionChain2) {
    return TableRow(
      children: [
        TableCell(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: 0.1,
                    child: Image.asset(
                      'lib/assets/images/pokeball-icon.png', //TODO: CRIAR ARQUIVO CONSTS AND CHANGE TO NEW PNG
                      scale:
                          5, //TODO: PENSAR EM JEITO DE ATRELAR ISSO AO TAMANHO DA TELA
                    ),
                  ),
                  SizedBox(
                    width: 75.0,
                    child: evolutionChain1.pokemon?.image!,
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(capitalizeFirstLetter(evolutionChain1.name)),
            ],
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Column(
            children: [
              for (Widget condition in _buildEvolutionContidions(
                  evolutionChain2.evolutionDetails![0]))
                condition,
              Icon(
                Icons.arrow_forward_rounded,
                color: DefaultTheme.grayscale[Grayscale.lightGray],
              ),
            ],
          ),
        ),
        TableCell(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: 0.1,
                    child: Image.asset(
                      'lib/assets/images/pokeball-icon.png', //TODO: CRIAR ARQUIVO CONSTS AND CHANGE TO NEW PNG
                      scale:
                          5, //TODO: PENSAR EM JEITO DE ATRELAR ISSO AO TAMANHO DA TELA
                    ),
                  ),
                  SizedBox(
                    width: 75.0,
                    child: evolutionChain2.pokemon?.image!,
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(capitalizeFirstLetter(evolutionChain2.name)),
            ],
          ),
        ),
      ],
    );
  }

  List<TableRow> _buildTableRowList(
      List<TableRow> chainList, EvolutionChain evolutionChain) {
    if (evolutionChain.chain.isNotEmpty) {
      for (EvolutionChain evolution in evolutionChain.chain) {
        chainList.add(_buildRow(evolutionChain, evolution));
        chainList.add(rowSpacer);
        if (evolution.chain.isNotEmpty) {
          _buildTableRowList(chainList, evolution);
        }
      }
    }
    return chainList;
  }

  @override
  Widget build(BuildContext context) {
    List<TableRow> chainList = List.empty(growable: true);
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
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Table(
                            children: [
                              for (TableRow row in _buildTableRowList(
                                  chainList, evolutionChain!))
                                row
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          );
  }
}
