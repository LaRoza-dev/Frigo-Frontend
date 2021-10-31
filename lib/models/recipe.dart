import 'package:get/get_connect/connect.dart';
import 'package:fridge/constants.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

class RecipeModel {
  String id = '';
  String name = '';
  String introduction = '';
  List<dynamic> cookSteps = [''];
  List<dynamic> ingredients = [''];
  Map<String, dynamic> nutritions = {'': ''};
  String prepTime = '';
  String cookTime = '';
  String serves = '';
  String skill = '';
  int stars = 0;
  String userId = '';

  RecipeModel(
      {required this.id,
      required this.name,
      required this.introduction,
      required this.cookSteps,
      required this.ingredients,
      required this.nutritions,
      required this.prepTime,
      required this.cookTime,
      required this.serves,
      required this.skill,
      required this.stars,
      required this.userId});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    introduction = json['introduction'];
    cookSteps = json['cook_steps'];
    ingredients = json['ingredients'];
    nutritions = json['nutritions'];
    prepTime = json['prep_time'];
    cookTime = json['cook_time'];
    serves = json['serves'];
    skill = json['skill'];
    stars = json['stars'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['introduction'] = this.introduction;
    data['cook_steps'] = this.cookSteps;
    data['ingredients'] = this.ingredients;
    data['nutritions'] = this.nutritions;
    data['prep_time'] = this.prepTime;
    data['cook_time'] = this.cookTime;
    data['serves'] = this.serves;
    data['skill'] = this.skill;
    data['stars'] = this.stars;
    data['user_id'] = this.userId;
    return data;
  }
}

class RecipeRepository extends GetConnect {
  String? baseUrl = "https://api.laroza.dev";

  //Get all Recipes
  Future<List<RecipeModel>> getRecipes(PaginationFilter filter) async {
    var token = kStorage.read("token");
    var response = await get(
        "/recipe/?pageNumber=${filter.page}&nPerPage=${filter.limit}",
        headers: {'Authorization': 'Bearer ' + token});
    if (response.statusCode == 200) {
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

    //Get Recipes by Ingredients
  Future<List<RecipeModel>> searchByIng(query, PaginationFilter filter) async {
    var token = kStorage.read("token");
    var response = await post(
        "/recipe/search?pageNumber=${filter.page}&nPerPage=${filter.limit}",
        query,
        headers: {'Authorization': 'Bearer ' + token});

    if (response.statusCode == 200) {
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

  //Get Recipes by Ingredients
  Future<List<RecipeModel>> searchByName(query, PaginationFilter filter) async {
    var token = kStorage.read("token");
    var response = await post(
        "/recipe/$query?pageNumber=${filter.page}&nPerPage=${filter.limit}",
        query,
        headers: {'Authorization': 'Bearer ' + token});

    if (response.statusCode == 200) {
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
  Future<Widget> getImage(String id) async {
    return CachedNetworkImage(
      imageUrl: '${dotenv.env["DETA_RECIPE_IMAGES"]}' + '$id',
      httpHeaders: headers,
      placeholder: (context, url) => new Container(
        width: 100,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => new Icon(Icons.error),
    );
  }
}
