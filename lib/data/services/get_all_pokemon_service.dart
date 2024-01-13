import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_projects_pokemon/model/pokemon_model_all.dart';

class GetAllPokemonService {
  final baseUrl = "https://pokeapi.co/api/v2/pokemon/";
  final apiKey = "";

  final Dio _dio = Dio();

  Future<PokemonAllModel?> getAllPokemon() async {
    // String endPoint = "";

    try {
      var response = await _dio.get(baseUrl);

      if (response.statusCode == 200) {
        var resultPokemon = PokemonAllModel.fromJson(response.data);

        return resultPokemon;
      } else {
        log("Error ${response.statusCode}");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
