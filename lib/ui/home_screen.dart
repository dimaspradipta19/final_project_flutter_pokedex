import 'package:final_projects_pokemon/data/provider/get_all_pokemon_provider.dart';
import 'package:final_projects_pokemon/ui/detail_screen.dart';
// import 'package:final_projects_pokemon/data/provider/get_name_pokemon_provider.dart';
import 'package:final_projects_pokemon/utils/enum_result.dart';
import 'package:final_projects_pokemon/utils/styles_guide.dart';
import 'package:final_projects_pokemon/widgets/slider_hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
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
      body: SingleChildScrollView(
        child: Column(
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
                style: myTextTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),

            Consumer<GetAllPokemonProvider>(
              builder: (context, GetAllPokemonProvider valueAllPokemon, child) {
                if (valueAllPokemon.state == ResultState.isLoading) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Shimmer.fromColors(
                          baseColor: Colors.grey[200]!,
                          highlightColor: Colors.grey,
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return const Card(
                                child: SizedBox(
                                  height: 200,
                                  width: 200,
                                ),
                              );
                            },
                          )),
                    ),
                  );
                } else if (valueAllPokemon.state == ResultState.hasData) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0),
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        valueAllPokemon.pokemonData?.results.length ?? 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return DetailScreen(
                                  namePokemon: valueAllPokemon
                                      .pokemonData!.results[index].name);
                            },
                          ));
                        },
                        child: FutureBuilder(
                          future: PaletteGenerator.fromImageProvider(
                            NetworkImage(
                                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png"),
                          ),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                snapshot.data != null) {
                              Color dominantColor =
                                  snapshot.data!.dominantColor!.color;
                              return Card(
                                color: dominantColor,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image.network(
                                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const SizedBox(width: 20.0),
                                      Column(
                                        children: [
                                          Text(
                                            "${valueAllPokemon.pokemonData?.results[index].name}",
                                            style: myTextTheme.bodyMedium
                                                ?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: whiteColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return const Card(
                                color: greyColor0,
                                child: CircularProgressIndicator.adaptive(),
                              );
                            }
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return const Text("Data kosong");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
