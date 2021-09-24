import 'package:get/get_connect/connect.dart';
import 'package:fridge/constants.dart';
import 'package:get/get.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

class RecipeModel {
  String id = '';
  String name = '';

  RecipeModel({required this.id, required this.name});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class RecipeRepository extends GetConnect {
  String? baseUrl = "https://api.laroza.dev";

  Future<List<RecipeModel>> getRecipes(PaginationFilter filter) async {
    var token = kStorage.read("token");
    var response = await get(
        "/recipe/?pageNumber=" +
            filter.page.toString() +
            "&nPerPage=" +
            filter.limit.toString(),
        headers: {'Authorization': 'Bearer ' + token});
    if (response.statusCode != 404) {
      List<RecipeModel> jsonDecoded = response.body['data']
          ?.map<RecipeModel>(
            (u) => RecipeModel.fromJson(u),
          )
          ?.toList();
      return jsonDecoded;
    } else {
      return Future.error('error');
    }
  }

  Future<List<RecipeModel>> search(query, PaginationFilter filter) async {
    var token = kStorage.read("token");
    var response = await post(
        "/recipe/search?pageNumber=" +
            filter.page.toString() +
            "&nPerPage=" +
            filter.limit.toString(),
        query,
        headers: {'Authorization': 'Bearer ' + token});

    if (response.statusCode != 404) {
      Future<List<RecipeModel>> jsonDecoded = await response.body['data']
          ?.map<RecipeModel>(
            (u) => RecipeModel.fromJson(u),
          )
          ?.toList();
      return jsonDecoded;
    } else {
      return Future.error('error');
    }
  }

  Future<String?> getToken() async {
    return kStorage.read("token");
  }
}

List<RecipeModel> recipeModelFromJson(String str) => List<RecipeModel>.from(
    json.decode(str).map((x) => RecipeModel.fromJson(x)));

String recipeModelToJson(List<RecipeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaginationFilter {
  late int page;
  late int limit;

  @override
  String toString() => 'PaginationFilter(page: $page, limit: $limit)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PaginationFilter && o.page == page && o.limit == limit;
  }

  @override
  int get hashCode => page.hashCode ^ limit.hashCode;
}

class DetaImage {
  Map<String, String> headers = {'X-Api-Key': '${dotenv.env['X_API_KEY']}'};
  Future<Uint8List> getImage(String id) async {
    final response = await http.get(
        Uri.parse(
          '${dotenv.env["DETA_RECIPE_IMAGES"]}' + '$id',
        ),
        headers: headers);
    return response.bodyBytes;
  }
}
