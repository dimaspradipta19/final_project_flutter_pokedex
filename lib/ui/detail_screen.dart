import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_projects_pokemon/data/provider/get_name_pokemon_provider.dart';
import 'package:final_projects_pokemon/utils/enum_result.dart';
import 'package:final_projects_pokemon/utils/styles_guide.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.namePokemon});

  final String namePokemon;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetNamePokemonProvider>(context, listen: false)
          .getNamePokemon(widget.namePokemon);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen pokemon"),
      ),
      body: SingleChildScrollView(
        child: Consumer<GetNamePokemonProvider>(
          builder: (context, GetNamePokemonProvider valueNamePokemon, child) {
            if (valueNamePokemon.state == ResultState.isLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (valueNamePokemon.state == ResultState.hasData) {
              return FutureBuilder(
                  future: PaletteGenerator.fromImageProvider(
                    NetworkImage(
                        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${valueNamePokemon.dataNamePokemon!.id.toString()}.png"),
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.data != null) {
                      Color dominantColor = snapshot.data!.dominantColor!.color;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(160.0),
                                    bottomRight: Radius.circular(160.0)),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 300.0,
                                  decoration: BoxDecoration(
                                    color: dominantColor,
                                  ),
                                ),
                              ),
                              Center(
                                // child: Image.network(
                                // valueNamePokemon.dataNamePokemon!.sprites
                                //     .other.officialArtwork.frontDefault,
                                //   height: 300,
                                // ),
                                child: CachedNetworkImage(
                                  imageUrl: valueNamePokemon
                                      .dataNamePokemon!
                                      .sprites
                                      .other
                                      .officialArtwork
                                      .frontDefault,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                            child: const CircularProgressIndicator
                                                .adaptive(),
                                          ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ],
                          ),
                          //Name Pokemon
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              valueNamePokemon.dataNamePokemon!.name,
                              style: myTextTheme.headlineMedium!.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 38.0),
                            ),
                          ),
                          // Type pokemon
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              "Type:",
                              style: myTextTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 12.0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemCount: valueNamePokemon
                                    .dataNamePokemon!.types.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Chip(
                                      backgroundColor: dominantColor,
                                      label: Text(
                                        valueNamePokemon.dataNamePokemon!
                                            .types[index].type.name,
                                        style: myTextTheme.bodyMedium!
                                            .copyWith(color: greyColor0),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          // Abilities pokemon
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              "Abilitites:",
                              style: myTextTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 12.0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemCount: valueNamePokemon
                                    .dataNamePokemon!.abilities.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Chip(
                                      backgroundColor: dominantColor,
                                      label: Text(
                                        valueNamePokemon.dataNamePokemon!
                                            .abilities[index].ability.name,
                                        style: myTextTheme.bodyMedium!
                                            .copyWith(color: greyColor0),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          // Statistic
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Statistic:",
                                  style: myTextTheme.bodyLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: valueNamePokemon
                                        .dataNamePokemon!.stats.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text(valueNamePokemon
                                                  .dataNamePokemon!
                                                  .stats[index]
                                                  .stat
                                                  .name),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                valueNamePokemon
                                                    .dataNamePokemon!
                                                    .stats[index]
                                                    .baseStat
                                                    .toString(),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: LinearPercentIndicator(
                                                animation: true,
                                                lineHeight: 20.0,
                                                animationDuration: 2500,
                                                percent: (valueNamePokemon
                                                            .dataNamePokemon!
                                                            .stats[index]
                                                            .baseStat /
                                                        100)
                                                    .clamp(0.0, 1.0),
                                                progressColor: dominantColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Height and Weight Pokemon
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1.0,
                              color: greyColor1,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Height:",
                                        style: myTextTheme.bodyLarge!.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 20.0),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 39.0,
                                        decoration: BoxDecoration(
                                          color: greyColor0,
                                          border: Border.all(color: blackColor),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                              "${valueNamePokemon.dataNamePokemon!.height.toString()} Meters"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Weight:",
                                        style: myTextTheme.bodyLarge!.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 20.0),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 39.0,
                                        decoration: BoxDecoration(
                                          color: greyColor0,
                                          border: Border.all(color: blackColor),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                              "${valueNamePokemon.dataNamePokemon!.weight.toString()} Kg"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                        ],
                      );
                    } else {
                      return const Text("Data Kosong");
                    }
                  });
            } else {
              return const Text("Data Kosong");
            }
          },
        ),
      ),
    );
  }
}
