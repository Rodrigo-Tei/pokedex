import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/helpers/build_pokemon_number.dart';
import 'package:pokedex/helpers/color_helper.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/modules/pokedex/bloc/pokemon_list_bloc.dart';
import 'package:pokedex/modules/pokedex/bloc/pokemon_list_event.dart';
import 'package:pokedex/modules/pokedex/bloc/pokemon_list_state.dart';
import 'package:pokedex/modules/pokedex/ui/type_tag.dart';
import 'package:pokedex/theme/colors.dart';

class PokemonDetailsPage extends StatefulWidget {
  const PokemonDetailsPage({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

@override
class _PokemonDetailsPageState extends State<PokemonDetailsPage>
    with TickerProviderStateMixin {
  Pokemon get pokemon => widget.pokemon;
  late PokemonListBloc _pokemonListBloc;
  late PokemonDetails pokemonDetails = PokemonDetails('', '');

  @override
  void initState() {
    super.initState();
    _pokemonListBloc = context.read<PokemonListBloc>();
    _pokemonListBloc.add(FetchPokemonDetails(pokemon.pokedexNumber));
  }

  Future<void> _handleListener(
      BuildContext context, PokemonListState state) async {
    if (state is PokemonDetailsLoading) {}
    if (state is PokemonDetailsLoaded) {
      pokemonDetails = state.pokemonDetails;
    }
  }

  AppBar _buildAppbar() {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: DefaultTheme.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0,
      backgroundColor: DefaultTheme.transparent,
    );
  }

  Widget _buildDetailsHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                pokemon.name,
                style: TextStyle(
                  fontSize: 36.0,
                  color: DefaultTheme.grayscale[Grayscale.white],
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                buildPokemonNumber(pokemon.pokedexNumber),
                style: TextStyle(
                    fontSize: 20.0,
                    color: DefaultTheme.grayscale[Grayscale.white],
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [for (String type in pokemon.types) TypeTag(type: type)],
          )
        ],
      ),
    );
  }

  Widget _buildDetailsContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: DefaultTheme.grayscale[Grayscale.white],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(36.0),
            topRight: Radius.circular(36.0),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 48.0),
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: <Widget>[
                Material(
                    color: Colors.transparent,
                    child: TabBar(
                      indicatorColor: getColorFromType(pokemon.types[0]),
                      labelColor: DefaultTheme.grayscale[Grayscale.black],
                      unselectedLabelColor:
                          DefaultTheme.grayscale[Grayscale.gray],
                      tabs: const [
                        Tab(text: "About"),
                        Tab(
                          text: "Base stats",
                        ),
                        Tab(text: "Evolution"),
                        Tab(text: "Moves"),
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: TabBarView(
                    children: [
                      _buildAboutTab(), //TODO: FOR GODSAKE PUT THIS ON COMPONENTS
                      const Text("BASE STATS "),
                      const Text("EVOLUTION "),
                      const Text("MOVES "),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPokemonImage() {
    return Positioned(
      bottom: MediaQuery.of(context).size.height / 2 - 137.45 / 2,
      left: MediaQuery.of(context).size.width / 2 -
          137.45, // HALF SCREEN WIDTH - HALF IMAGE SIZE ---- TODO: GET RID OF MAGIC NUMBERS
      child: Hero(
        createRectTween: (begin, end) {
          return MaterialRectCenterArcTween(begin: begin, end: end);
        },
        tag: pokemon.pokedexNumber.toString(),
        transitionOnUserGestures: true,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.width * 0.7,
          child: pokemon.image!,
        ),
      ),
    );
  }

  Widget _buildAboutTab() {
    return Container(
      margin: const EdgeInsets.all(24.0),
      child: Text(
        pokemonDetails.flavorText,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokemonListBloc, PokemonListState>(
      bloc: _pokemonListBloc,
      listener: _handleListener,
      builder: (BuildContext context, PokemonListState state) {
        return Scaffold(
          appBar: _buildAppbar(),
          backgroundColor: getColorFromType(pokemon.types[0]),
          body: Stack(
            children: [
              _buildDetailsHeader(),
              Stack(
                children: [
                  _buildDetailsContainer(),
                  _buildPokemonImage(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
