import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_projects_pokemon/data/provider/get_name_pokemon_provider.dart';
import 'package:final_projects_pokemon/utils/enum_result.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../utils/styles_guide.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  List<String> examplePokemonName = [
    "charmander",
    "pikachu",
    "alakazam",
    "zubat",
    "magikarp",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 48.0,
                    width: 48.0,
                    decoration: const BoxDecoration(
                      color: yellowColor1,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.arrow_back_ios_new_sharp)),
                  ),
                ),
                const SizedBox(width: 5.0),
                Expanded(
                  flex: 4,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      autofocus: true,
                      controller: _searchController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "Search Pokemon",
                        hintStyle:
                            myTextTheme.bodyLarge!.copyWith(color: greyColor3),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: BorderSide.none),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: greyColor3,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Provider.of<GetNamePokemonProvider>(context, listen: false)
                        .getNamePokemon(_searchController.text);
                  },
                  child: Container(
                    height: 48.0,
                    width: 48.0,
                    decoration: const BoxDecoration(
                      color: yellowColor1,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.search_outlined)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: examplePokemonName.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _searchController.text = examplePokemonName[index];
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Chip(
                      label: Text(
                        examplePokemonName[index],
                        style: myTextTheme.bodySmall!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Consumer<GetNamePokemonProvider>(builder:
              (context, GetNamePokemonProvider valueNamePokemon, child) {
            if (valueNamePokemon.state == ResultState.isLoading) {
              return const CircularProgressIndicator.adaptive();
            } else if (valueNamePokemon.state == ResultState.hasData ||
                _searchController.text.isNotEmpty) {
              return FutureBuilder(
                  future: PaletteGenerator.fromImageProvider(
                    NetworkImage(
                        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${valueNamePokemon.dataNamePokemon!.id.toString()}.png"),
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.data != null) {
                      Color dominantColor = snapshot.data!.dominantColor!.color;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: dominantColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                  imageUrl: valueNamePokemon
                                      .dataNamePokemon!.sprites.frontDefault),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    valueNamePokemon.dataNamePokemon!.name,
                                    style: myTextTheme.bodyLarge!
                                        .copyWith(color: whiteColor),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    valueNamePokemon
                                        .dataNamePokemon!.types[0].type.name,
                                    style: myTextTheme.bodyLarge!
                                        .copyWith(color: whiteColor),
                                  ),
                                ],
                              ),
                              Expanded(child: Container()),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, "/detailscreen", arguments: {
                                      "namePokemon":
                                          valueNamePokemon.dataNamePokemon!.name
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: whiteColor,
                                  ))
                            ],
                          ),
                        ),
                      );
                    }
                    return Container();
                  });
            } else if (valueNamePokemon.state == ResultState.error) {
              return const Text("Kosong Datanya kak");
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/pokemon_together.png",
                      height: 150.0,
                    ),
                    const SizedBox(height: 20.0),
                    Text("Pokemon Tidak Ditemukan",
                        style: myTextTheme.bodyLarge),
                  ],
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
