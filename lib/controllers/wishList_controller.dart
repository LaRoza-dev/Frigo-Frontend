import 'package:Frigo/models/recipe.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Wishlist {
  List wishlist = [];
}

class WishlistTextController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController searchText;
  late RxBool hasText = false.obs;

  void clearController() {
    searchText.clear();
  }

  @override
  onInit() {
    super.onInit();
    searchText = TextEditingController();
  }

  final addIngValidator = PatternValidator(r'(.|\s)*\S(.|\s)*',
      errorText: 'Recipe name must have at least one letter.');

  bool checkFoodField() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return false;
    } else {
      formKey.currentState!.save();
      return true;
    }
  }
}

class WishlistController extends GetxController {
  WishlistController(this._recipeRepository);
  final RecipeRepository _recipeRepository;

  final _wishlist = Wishlist().obs;
  List get wishlistItems => _wishlist.value.wishlist;

  @override
  onInit() {
    getWishlistItems();
    ever(_wishlist, (_) => updateWishlistItems(wishlistItems));
    super.onInit();
  }

  void addItem(String input) {
    _wishlist.update((val) {
      val!.wishlist.add(input);
    });
  }

  void remove(int index) {
    _wishlist.update((val) {
      val!.wishlist.removeAt(index);
    });
  }

  Future<void> getWishlistItems() async {
    final wishlistData = await _recipeRepository.getWishlist();
    if (wishlistData.isEmpty) {
      _wishlist.update((val) {
        val!.wishlist = [];
      });
    }
    _wishlist.update((val) {
      val!.wishlist = wishlistData;
    });
  }

  Future<void> updateWishlistItems(items) async {
    await _recipeRepository.updateWishlist(items);
  }
}
