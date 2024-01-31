import 'package:final_projects_pokemon/model/pokemon_name_model.dart';
import 'package:flutter/material.dart';

class FavoritePokemonProvider with ChangeNotifier {
  List<NamePokemonModel?> favoritePokemon = [];
  NamePokemonModel? namePokemon;

  void addPokemon(NamePokemonModel dataAddToList) async {
    favoritePokemon.add(dataAddToList);
    notifyListeners();
  }

  //Feature lagi coba coba
  Future<bool> isFavorited(int idPokemon) async {
    final isFavPokemon = favoritePokemon.where((element) => element!.id == idPokemon);
    return isFavPokemon.isNotEmpty;
  }
}
