import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:fridge/constants.dart';
import 'package:get/get.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Recipe extends GetConnect {
  String? baseUrl = "https://api.laroza.dev";

  String? name = '';
  String? id = '';

  Future<List<dynamic>> search(query, pageNumber, nPerPage) async {
    var token = kStorage.read("token");
    var response = await post(
        "/recipe/search?pageNumber=" +
            (pageNumber ?? 0) +
            "&nPerPage=" +
            (nPerPage ?? 10),
        query,
        headers: {'Authorization': 'Bearer ' + token});

    if (response.statusCode != 404) {
      List<dynamic> jsonDecoded = response.body['data'][0];

      return jsonDecoded;

      // final String? value = decodedRes["access_token"];
      // final String key = 'token';
      // await kStorage.write(key, value);

      // final String? testRes = kStorage.read<String?>(key);

    } else {
      return Future.error('error');
    }
  }

  Future<String?> getToken() async {
    return kStorage.read("token");
  }
}
