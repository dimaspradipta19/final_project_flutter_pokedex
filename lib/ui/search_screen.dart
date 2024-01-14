import 'package:final_projects_pokemon/data/provider/get_name_pokemon_provider.dart';
import 'package:final_projects_pokemon/main.dart';
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
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Provider.of<GetNamePokemonProvider>(context,
                                  listen: false)
                              .getNamePokemon();

                          // var test = Provider.of<GetNamePokemonProvider>(context,
                          //     listen: false);
                          // print(test.dataNamePokemon?.toString());
                        },
                        icon: const Icon(Icons.search),
                      ),
                      IconButton(
                        onPressed: () {
                          alice.showInspector();
                        },
                        icon: const Icon(Icons.show_chart),
                      ),
                    ],
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
              var value = '';
              try {
                value = valueNamePokemon
                        .dataNamePokemon?.abilities.first.ability.name ??
                    "Kosong";
              } catch (e) {
                value = "Kosong";
              }
              return Text(value);
            } else {
              return const Text("Kosong Datanya kak");
            }
          }),
        ],
      ),
    );
  }
}
