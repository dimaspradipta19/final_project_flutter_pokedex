import 'dart:developer';

import 'package:final_projects_pokemon/data/services/get_all_pokemon_service.dart';
import 'package:final_projects_pokemon/model/pokemon_model_all.dart';
import 'package:final_projects_pokemon/utils/enum_result.dart';
import 'package:flutter/material.dart';

class GetAllPokemonProvider extends ChangeNotifier {
  GetAllPokemonService service = GetAllPokemonService();
  PokemonAllModel? pokemonData;
  ResultState state = ResultState.noData;

  void getAllPokemonData() async {
    try {
      state = ResultState.isLoading;
      notifyListeners();

      pokemonData = await service.getAllPokemon();

      if (pokemonData != null) {
        state = ResultState.hasData;
        notifyListeners();
      } else {
        state = ResultState.noData;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
