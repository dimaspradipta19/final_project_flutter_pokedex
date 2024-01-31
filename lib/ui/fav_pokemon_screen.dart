import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_projects_pokemon/data/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/styles_guide.dart';
import 'detail_screen.dart';

class FavoritePokemonScreen extends StatelessWidget {
  const FavoritePokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Pokemon"),
      ),
      body: Consumer<FavoritePokemonProvider>(
        builder: (context, valueFavPokemon, child) {
          if (valueFavPokemon.favoritePokemon.isEmpty) {
            return const Center(
              child: Text("Empty Fav Pokemon"),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: valueFavPokemon.favoritePokemon.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  child: Container(
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
                            imageUrl: valueFavPokemon
                                .favoritePokemon[index]!.sprites.frontDefault),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              valueFavPokemon.favoritePokemon[index]!.name,
                              style: myTextTheme.bodyLarge!
                                  .copyWith(color: whiteColor),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              valueFavPokemon
                                  .favoritePokemon[index]!.types[0].type.name,
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
                                    namePokemon: valueFavPokemon
                                        .favoritePokemon[index]!.name,
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
              },
            );
          }
        },
      ),
    );
  }
}
