import 'package:get/get_connect/connect.dart';
import 'package:fridge/constants.dart';
import 'package:get/get.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


class Recipe extends GetConnect {
  String? baseUrl = "https://api.laroza.dev";

  Future<List> getAll(pageNumber, nPerPage) async {
    var token = kStorage.read("token");
    var response = await get(
        "/recipe/?pageNumber=" +
            (pageNumber ?? 0) +
            "&nPerPage=" +
            (nPerPage ?? 10),
        headers: {'Authorization': 'Bearer ' + token});

    if (response.statusCode != 404) {
      List jsonDecoded = response.body['data'];
      return jsonDecoded;
    } else {
      return Future.error('error');
    }
  }

  Future<List> search(query, pageNumber, nPerPage) async {
    var token = kStorage.read("token");
    var response = await post(
        "/recipe/search?pageNumber=" +
            (pageNumber ?? 0) +
            "&nPerPage=" +
            (nPerPage ?? 10),
        query,
        headers: {'Authorization': 'Bearer ' + token});

    if (response.statusCode != 404) {
      List jsonDecoded = response.body['data'];
      return jsonDecoded;
    } else {
      return Future.error('error');
    }
  }

  Future<String?> getToken() async {
    return kStorage.read("token");
  }
}


class DetaImage {
  Map<String, String> headers = {
    'X-Api-Key': '${dotenv.env['X_API_KEY']}'
  };
  Future<Uint8List> getImage(String id) async {
    final response = await http.get(
        Uri.parse(
          '${dotenv.env["DETA_RECIPE_IMAGES"]}'+'$id',
        ),
        headers: headers);
    return response.bodyBytes;
  }
}