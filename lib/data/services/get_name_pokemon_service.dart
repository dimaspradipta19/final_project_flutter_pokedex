import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_projects_pokemon/model/pokemon_name_model.dart';

class GetNamePokemonService {
  final baseUrl = "https://pokeapi.co/api/v2/pokemon/bulbasaur";
  final apiKey = "";

  final Dio _dio = Dio();

  Future<NamePokemonModel?> getNamePokemon() async {
    try {
      Response response = await _dio.get(baseUrl);

      print(response.data);

      if (response.statusCode == 200) {
        var resultNamePokemon = NamePokemonModel.fromJson(response.data);
        return NamePokemonModel.fromJson(response.data);
      } else {
        log("Error ${response.statusCode}");
      }
    } catch (e) {
      log("Error ni bro di service name pokemon ${e.toString()}");
    }
    return null;
  }
}
