import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_projects_pokemon/model/pokemon_name_model.dart';

import '../../main.dart';

class GetNamePokemonService {
  final baseUrl = "https://pokeapi.co/api/v2/";
  final apiKey = "";

  Dio _dio = Dio();

  Future<NamePokemonModel?> getNamePokemon() async {
    try {
      BaseOptions baseOptions;
      baseOptions = BaseOptions(
        baseUrl: baseUrl,
        // connectTimeout: 30000,
        // receiveTimeout: 30000,
        validateStatus: (status) {
          return status! < 500;
        },
      );
      _dio = Dio(baseOptions);
      _dio.interceptors.add(alice.getDioInterceptor());
      const URL = 'pokemon/bulbasaur';
      Response response = await _dio.get(URL);

      // print(response.data);

      if (response.statusCode == 200) {
        final result = NamePokemonModel.fromJson(response.data);
        print('----');
        print(result);
        print('----');
        return result;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error ni bro di service name pokemon ${e.toString()}");
    }
    return null;
  }
}
