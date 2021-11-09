import 'package:Frigo/models/pageContents.dart';
import 'package:get/get.dart';
import 'package:Frigo/components/containers/menu_container.dart';
import 'package:Frigo/components/containers/allFoods_container.dart';
import 'package:Frigo/components/containers/searchByIng_container.dart';
import 'package:Frigo/components/containers/fridge_container.dart';
import 'package:Frigo/components/containers/wishList_container.dart';
import 'package:Frigo/components/foodSearchField.dart';
import 'package:Frigo/components/addItemTextFiels.dart';
import 'package:Frigo/controllers/searchByIng_controller.dart';
import 'package:Frigo/models/recipe.dart';
import 'package:Frigo/controllers/wishList_controller.dart';
import 'package:Frigo/controllers/findAllRecipe_controller.dart';

final FindAllRecipeController findAllRecipeController =
    Get.put(FindAllRecipeController(Get.find<RecipeRepository>()));

final FindAllRecipeTextController findAllRecipeTextController =
    Get.put(FindAllRecipeTextController());
  
final SearchByIngController searchByIngController =
    Get.put(SearchByIngController(Get.find<RecipeRepository>()));

final SearchByIngTextController searchByIngTextController =
    Get.put(SearchByIngTextController());

final WishlistController wishlistController =
    Get.put(WishlistController(Get.find<RecipeRepository>()));

final WishlistTextController wishlistTextController =
    Get.put(WishlistTextController());

class PageContentsController extends GetxController {
  final pageContents = PageContents().obs;

  updateContents(int input) {
    if (input == 0) {
      pageContents.update((val) {
        val!.title = 'All Foods';
        val.container = AllFoodsContainer();
        val.textField = FoodSearchFlied(controller: findAllRecipeController,textController: findAllRecipeTextController,);
        val.searchbarVisibility = true;
        val.itemsVisibility = false;
        updateFindType('all');
      });
    } else if (input == 1) {
      pageContents.update((val) {
        val!.title = 'Fridge';
        val.container = FridgeContainer();
        val.textField = AddItemTextField(
          controller: searchByIngController,
          textController: searchByIngTextController,
        );
        val.searchbarVisibility = true;
        updateFindType('fridge');
      });
    } else if (input == 2) {
      pageContents.update((val) {
        val!.title = 'Wish List';
        val.container = WishlistContainer();
        val.textField = AddItemTextField(
          controller: wishlistController,
          textController: wishlistTextController,
        );
        val.searchbarVisibility = true;
      });
    } else if (input == 3) {
      pageContents.update((val) {
        val!.title = 'Menu';
        val.container = MenuContainer();
        val.searchbarVisibility = false;
      });
    }
  }

  updateFindType(String input) {
    if (input == 'all') {
      pageContents.update((val) {
        val!.container = AllFoodsContainer();
        val.textField = FoodSearchFlied(controller: findAllRecipeController,textController: findAllRecipeTextController,);
      });
    } else if (input == 'searchByIng') {
      pageContents.update((val) {
        val!.title = "Search By Ing";
        val.container = SearchByIng();
        val.textField = FoodSearchFlied(controller: searchByIngController,textController: searchByIngTextController,);
        val.itemsVisibility = true;
      });
    }
  }
}
