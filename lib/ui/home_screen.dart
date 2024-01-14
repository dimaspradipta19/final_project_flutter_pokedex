import 'dart:developer';

import 'package:final_projects_pokemon/data/provider/get_all_pokemon_provider.dart';
import 'package:final_projects_pokemon/data/provider/get_name_pokemon_provider.dart';
import 'package:final_projects_pokemon/utils/enum_result.dart';
import 'package:final_projects_pokemon/utils/styles_guide.dart';
import 'package:final_projects_pokemon/widgets/slider_hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/logo_widget.dart';
import '../widgets/search_setting_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetAllPokemonProvider>(context, listen: false)
          .getAllPokemonData();
      // Provider.of<GetNamePokemonProvider>(context, listen: false)
      //     .getNamePokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          // LOGO WIDGET
          const LogoWidget(),
          // SEARCH
          const SearchSettingWidget(),
          //  SLIDER
          const SizedBox(height: 20.0),
          const SliderHeroWidget(),

          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              "All Pokemon",
              style:
                  myTextTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: Consumer<GetAllPokemonProvider>(
              builder: (context, GetAllPokemonProvider valueAllPokemon, child) {
                if (valueAllPokemon.state == ResultState.isLoading) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Shimmer.fromColors(
                          baseColor: Colors.grey[200]!,
                          highlightColor: Colors.grey,
                          child: const Card(
                            child: SizedBox(
                              height: 200,
                              width: 200,
                            ),
                          )),
                    ),
                  );
                } else if (valueAllPokemon.state == ResultState.hasData) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount:
                        valueAllPokemon.pokemonData?.results.length ?? 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          log("Pokemon Detail ${index + 1}");
                        },
                        child: Card(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Image.network(
                                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png"),
                                const SizedBox(width: 20.0),
                                Column(
                                  children: [
                                    Text(
                                      "${valueAllPokemon.pokemonData?.results[index].name}",
                                      style: myTextTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${valueAllPokemon.pokemonData?.results[index].name}",
                                      style: myTextTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );

                      // Column(
                      //   children: [
                      // Image.network(
                      //     "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png"),
                      // Text(
                      //     "${valueAllPokemon.pokemonData?.results[index].name}",
                      //     style: myTextTheme.bodyMedium
                      //         ?.copyWith(fontWeight: FontWeight.bold)),
                      //   ],
                      // );
                    },
                  );
                } else {
                  return const Text("Data kosong");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
