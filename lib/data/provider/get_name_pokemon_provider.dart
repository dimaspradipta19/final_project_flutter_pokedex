import 'dart:developer';

import 'package:final_projects_pokemon/data/services/get_name_pokemon_service.dart';
import 'package:final_projects_pokemon/model/pokemon_name_model.dart';
import 'package:final_projects_pokemon/utils/enum_result.dart';
import 'package:flutter/material.dart';

class GetNamePokemonProvider extends ChangeNotifier {
  NamePokemonModel? dataNamePokemon;
  GetNamePokemonService service = GetNamePokemonService();
  ResultState state = ResultState.noData;

  Future<dynamic> getNamePokemon(String namePokemon) async {
    try {
      state = ResultState.isLoading;
      notifyListeners();
      dataNamePokemon = await service.getNamePokemon(namePokemon);
      if (dataNamePokemon != null) {
        state = ResultState.hasData;
        notifyListeners();
      } else {
        state = ResultState.noData;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
