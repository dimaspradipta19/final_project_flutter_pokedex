import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_projects_pokemon/data/provider/get_name_pokemon_provider.dart';
import 'package:final_projects_pokemon/ui/detail_screen.dart';
import 'package:final_projects_pokemon/utils/enum_result.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SearchScreen"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "Search Pokemon",
                        hintStyle: myTextTheme.bodyLarge,
                        filled: true,
                        fillColor: greyColor1,

                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: BorderSide.none),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      Provider.of<GetNamePokemonProvider>(context,
                              listen: false)
                          .getNamePokemon(_searchController.text);

                      // var test = Provider.of<GetNamePokemonProvider>(context,
                      //     listen: false);
                      // print(test.dataNamePokemon?.toString());
                    },
                    icon: const Icon(Icons.search),
                  ),
                ),
              ],
            ),
          ),
          Consumer<GetNamePokemonProvider>(builder:
              (context, GetNamePokemonProvider valueNamePokemon, child) {
            if (valueNamePokemon.state == ResultState.isLoading) {
              return const CircularProgressIndicator.adaptive();
            } else if (valueNamePokemon.state == ResultState.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Container(
                  // height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.all(
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
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DetailScreen(
                                  namePokemon:
                                      valueNamePokemon.dataNamePokemon!.name,
                                );
                              },
                            ));
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: whiteColor,
                          ))
                    ],
                  ),
                ),
              );
            } else if(valueNamePokemon.state == ResultState.error) {
              return const Text("Kosong Datanya kak");
            } else {
              return const Text("Data Kosong");
            }
          }),
        ],
      ),
    );
  }
}
