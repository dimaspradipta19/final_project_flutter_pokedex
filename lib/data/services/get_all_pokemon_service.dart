import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_projects_pokemon/model/pokemon_model_all.dart';

class GetAllPokemonService {
  final baseUrl = "https://pokeapi.co/api/v2/pokemon/";
  final apiKey = "";

  final Dio _dio = Dio();

  Future<PokemonAllModel> getAllPokemon() async {
    try {
      var response = await _dio.get(baseUrl);

      if (response.statusCode == 200) {
        var resultPokemon = PokemonAllModel.fromJson(response.data);
        return resultPokemon;
      } else {
        return _handleError(response);
      }
    } catch (e) {
      return _handleError(e);
    }
  }

  _handleError(error) {
    String errorDesc = "";
    DioException dioError = error as DioException;
    switch (dioError.type) {
      // ignore: deprecated_member_use
      case DioExceptionType.connectionTimeout:
        errorDesc = "Connection to server is timeout";
        break;
      case DioExceptionType.sendTimeout:
        errorDesc = "Send timeout in connection to server";
        break;
      case DioExceptionType.receiveTimeout:
        errorDesc = "Received timeout in connection to server";
        break;
      case DioExceptionType.badResponse:
        errorDesc =
            "Received server error status code ${dioError.response!.statusCode}";
        break;
      case DioExceptionType.cancel:
        errorDesc = "Connection to server was cancelled";
        break;
      case DioExceptionType.unknown:
        errorDesc = "Unknown error connection to server ";
        break;
      default:
    }
    final Response errorResponse = Response(
      requestOptions: RequestOptions(path: ""),
      data: errorDesc,
      statusMessage: (dioError.response!).toString(),
    );
    // You might want to log the error message here
    log("Error: $errorDesc");
    return errorResponse;
  }
}
