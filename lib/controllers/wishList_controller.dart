import 'package:Frigo/models/recipe.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Wishlist {
  List wishlist = [];
}

class WishlistTextController extends GetxController {
  late TextEditingController searchText;

  void clearController() {
    searchText.clear();
  }

  @override
  onInit() {
    super.onInit();
    searchText = TextEditingController();
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

  void addWishlist(String input) {
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
