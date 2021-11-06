import 'package:Frigo/models/pageContents.dart';
import 'package:get/get.dart';
import 'package:Frigo/components/containers/menu_container.dart';
import 'package:Frigo/components/containers/foods_container.dart';
import 'package:Frigo/components/containers/foods_container2.dart';
import 'package:Frigo/components/containers/fridge_container.dart';
import 'package:Frigo/components/containers/wishList_container.dart';

class PageContentsController extends GetxController {
  final pageContents = PageContents().obs;

  updateContents(int input) {
    if (input == 0) {
      pageContents.update((val) {
        val!.title = 'All Foods';
        val.container = FoodsContainer();
        val.visibility = true;
      });
    } else if (input == 1) {
      pageContents.update((val) {
        val!.title = 'Fridge';
        val.container = FridgeContainer();
        val.visibility = true;
      });
    } else if (input == 2) {
      pageContents.update((val) {
        val!.title = 'Wish List';
        val.container = WishListContainer();
        val.visibility = true;
      });
    } else if (input == 3) {
      pageContents.update((val) {
        val!.title = 'Menu';
        val.container = MenuContainer();
        val.visibility = false;
      });
    }
  }

  updateCondition(String input) {
    if (input == 'all') {
      pageContents.update((val) {
        val!.container = FoodsContainer();
      });
    } else if (input == 'searchByIng') {
      pageContents.update((val) {
        val!.title = "Search By Ing";
        val.container = FoodsContainer2();
      });
    }
  }
}
