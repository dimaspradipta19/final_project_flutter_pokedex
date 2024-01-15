import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_projects_pokemon/model/pokemon_name_model.dart';

class GetNamePokemonService {
  final baseUrl = "https://pokeapi.co/api/v2/pokemon/";
  final apiKey = "";

  final Dio _dio = Dio();

  Future<NamePokemonModel?> getNamePokemon(String namePokemon) async {
    try {
      Response response = await _dio.get("$baseUrl$namePokemon");

      if (response.statusCode == 200) {
        var resultNamePokemon = NamePokemonModel.fromJson(response.data);
        return resultNamePokemon;
      } else {
        log("Error ${response.statusCode}");
      }
    } catch (e) {
      log("Error ni bro di service name pokemon ${e.toString()}");
    }
    return null;
  }
}
