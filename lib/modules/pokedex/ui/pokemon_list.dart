import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/modules/commons/loading_list_page.dart';
import 'package:pokedex/modules/pokedex/bloc/pokemon_list_bloc.dart';
import 'package:pokedex/modules/pokedex/bloc/pokemon_list_event.dart';
import 'package:pokedex/modules/pokedex/bloc/pokemon_list_state.dart';
import 'package:pokedex/modules/pokedex/ui/pokemon_card.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:pokedex/theme/colors.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key, required this.title});

  final String title;

  @override
  State<PokemonList> createState() => _PokemonListState();
}

@override
class _PokemonListState extends State<PokemonList> {
  late PokemonListBloc _pokemonListBloc;
  List<Pokemon> pokemonList = List.empty();
  late bool _loading = false;

  @override
  void initState() {
    super.initState();
    _pokemonListBloc = context.read<PokemonListBloc>();
    _pokemonListBloc.add(FetchPokemonList());
  }

  Future<void> _handleListener(
      BuildContext context, PokemonListState state) async {
    if (state is PokemonListLoading) {
      _loading = true;
    }
    if (state is PokemonListLoaded) {
      pokemonList = state.pokemonList;
      _loading = false;
    }
  }

  Widget _buildLoadingScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/assets/gif/mew_loading.gif'),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: 28.0,
              color: DefaultTheme.grayscale[Grayscale.black],
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  'Loading . . .',
                  speed: const Duration(milliseconds: 200),
                ),
              ],
              isRepeatingAnimation: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget pokemonCardItemBuilder(context, i) {
    if (i == pokemonList.length) {
      return Container(
        decoration: BoxDecoration(color: Colors.red),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: const [
            Expanded(
              child: LoadingListPage(),
            )
          ],
        ),
      );
    }
    return PokemonCard(pokemon: pokemonList[i]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokemonListBloc, PokemonListState>(
      bloc: _pokemonListBloc,
      listener: _handleListener,
      builder: (BuildContext context, PokemonListState state) {
        return _loading
            ? Scaffold(
                body: _buildLoadingScreen(),
              )
            : Scaffold(
                appBar: AppBar(
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: DefaultTheme.transparent,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  actions: [
                    IconButton(
                      onPressed: () => {},
                      icon: const Icon(Icons.search),
                      color: DefaultTheme.grayscale[Grayscale.black],
                    ),
                    IconButton(
                      onPressed: () => {},
                      icon: const Icon(Icons.filter_alt_outlined),
                      color: DefaultTheme.grayscale[Grayscale.black],
                    ),
                  ],
                  elevation: 0,
                  backgroundColor: DefaultTheme.transparent,
                  bottom: AppBar(
                    elevation: 0,
                    backgroundColor: DefaultTheme.transparent,
                    title: Text(
                      widget.title,
                      style: TextStyle(
                        color: DefaultTheme.grayscale[Grayscale.black],
                        fontWeight: FontWeight.w600,
                        fontSize: 36.0,
                      ),
                    ),
                  ),
                ),
                body: Stack(
                  children: [
                    Transform.translate(
                      offset: Offset(
                        MediaQuery.of(context).size.width * 0.5,
                        -MediaQuery.of(context).size.height * 0.3,
                      ),
                      child: Opacity(
                        opacity: 0.1,
                        child: Image.asset(
                          'lib/assets/images/pokeball-icon.png', //TODO: CRIAR ARQUIVO CONSTS
                          scale:
                              1.4, //TODO: PENSAR EM JEITO DE ATRELAR ISSO AO TAMANHO DA TELA
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 2.5 / 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: pokemonList.length + 1,
                        // itemBuilder: (BuildContext context, index) {
                        //   return PokemonCard(
                        //     pokemon: pokemonList[index],
                        //   );
                        // },
                        itemBuilder: pokemonCardItemBuilder,
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
