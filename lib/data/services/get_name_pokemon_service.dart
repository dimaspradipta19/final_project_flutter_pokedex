import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_projects_pokemon/model/pokemon_name_model.dart';

class GetNamePokemonService {
  final baseUrl = "https://pokeapi.co/api/v2/pokemon/pikachu";
  final apiKey = "";

  final Dio _dio = Dio();

  Future<NamePokemonModel?> getNamePokemon() async {
    try {
      var response = await _dio.get(baseUrl);

      if (response.statusCode == 200) {
        // var resultNamePokemon = NamePokemonModel.fromJson(response.data);
        NamePokemonModel? resultNamePokemon =
            NamePokemonModel.fromJson(response.data);

            print(resultNamePokemon);
        return namePokemonModelFromJson(response.data);
      } else {
        log("Error ${response.statusCode}");
      }
    } catch (e) {
      log("Error ni bro di service name pokemon ${e.toString()}");
      print(e.toString());
    }
    return null;
  }
}
