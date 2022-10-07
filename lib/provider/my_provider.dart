// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task/models/cart_modle.dart';
import 'package:task/models/categories_models.dart';
import 'package:task/models/food_categories_model.dart';
import 'package:task/models/food_modle.dart';

class MyController extends GetxController {
  var burgerList = <CategoriesModle>[].obs;
  late CategoriesModle burgerModle;
  Future<void> getBurgerCategorie() async {
    List<CategoriesModle> newBurgerList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('1cLnIt57ySSIQxvpLpbG')
        .collection('burger')
        .get();
    querySnapshot.docs.forEach((element) {
      var data = element.data() as Map<String, dynamic>;

      burgerModle = CategoriesModle(
        image: data['image'],
        name: data['name'],
      );

      newBurgerList.add(burgerModle);
      burgerList.value = newBurgerList;
    });
  }

  get throwBurgerList {
    return burgerList;
  }

  ///////////////// 2nd Category //////////////////
  var recipeList = <CategoriesModle>[].obs;
  late CategoriesModle recipeModle;
  Future<void> getRecipeCategorie() async {
    List<CategoriesModle> newRecipeList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('1cLnIt57ySSIQxvpLpbG')
        .collection('recipe')
        .get();
    querySnapshot.docs.forEach((element) {
      var data = element.data() as Map<String, dynamic>;

      recipeModle = CategoriesModle(
        image: data['image'],
        name: data['name'],
      );

      newRecipeList.add(recipeModle);
      recipeList.value = newRecipeList;
    });
  }

  get throwRecipeList {
    return recipeList;
  }

  ///////////////// 3rd Category //////////////////
  var pizzaList = <CategoriesModle>[].obs;
  late CategoriesModle pizzaModle;
  Future<void> getPizzaCategorie() async {
    List<CategoriesModle> newPizzaList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('1cLnIt57ySSIQxvpLpbG')
        .collection('pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      var data = element.data() as Map<String, dynamic>;

      pizzaModle = CategoriesModle(
        image: data['image'],
        name: data['name'],
      );

      newPizzaList.add(pizzaModle);
      pizzaList.value = newPizzaList;
    });
  }

  get throwPizzaList {
    return pizzaList;
  }

  ///////////////// 4th Category //////////////////
  var drinkList = <CategoriesModle>[].obs;
  late CategoriesModle drinkModle;
  Future<void> getDrinkCategorie() async {
    List<CategoriesModle> newDrinkList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('1cLnIt57ySSIQxvpLpbG')
        .collection('drink')
        .get();
    querySnapshot.docs.forEach((element) {
      var data = element.data() as Map<String, dynamic>;

      drinkModle = CategoriesModle(
        image: data['image'],
        name: data['name'],
      );

      newDrinkList.add(drinkModle);
      drinkList.value = newDrinkList;
    });
  }

  get throwDrinkList {
    return drinkList;
  }

  ///////////////// 5th Category //////////////////
  var allList = <CategoriesModle>[].obs;
  late CategoriesModle allModle;
  Future<void> getAllCategorie() async {
    List<CategoriesModle> newAllList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('1cLnIt57ySSIQxvpLpbG')
        .collection('all')
        .get();
    querySnapshot.docs.forEach((element) {
      var data = element.data() as Map<String, dynamic>;

      allModle = CategoriesModle(
        image: data['image'],
        name: data['name'],
      );

      newAllList.add(allModle);
      allList.value = newAllList;
    });
  }

  get throwAllList {
    return allList;
  }

  /////////////////////  Single Food Item     //////////////////////////
  List<FoodModle> foodModleList = [];
  late FoodModle foodModle;
  Future<void> getFoodList() async {
    List<FoodModle> newSingleFoodList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Foods').get();
    querySnapshot.docs.forEach(
      (element) {
        var data = element.data() as Map<String, dynamic>;

        foodModle = FoodModle(
          name: data['name'],
          image: data['image'],
          price: data['price'],
        );
        newSingleFoodList.add(foodModle);
        foodModleList = newSingleFoodList;
      },
    );
  }

  get throwFoodModleList {
    return foodModleList;
  }

  ///////////////burger categories list//////////
  List<FoodCategoriesModle> burgerCategoriesList = [];
  late FoodCategoriesModle burgerCategoriesModle;
  Future<void> getBurgerCategoriesList() async {
    List<FoodCategoriesModle> newBurgerCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodCategories')
        .doc('khEy77DnG7mYdzTxCihg')
        .collection('burger')
        .get();
    querySnapshot.docs.forEach((element) {
      var data = element.data() as Map<String, dynamic>;
      burgerCategoriesModle = FoodCategoriesModle(
        image: data['image'],
        name: data['name'],
        price: data['price'],
      );
      newBurgerCategoriesList.add(burgerCategoriesModle);
      burgerCategoriesList = newBurgerCategoriesList;
    });
  }

  get throwBurgerCategoriesList {
    return burgerCategoriesList;
  }

  ///////////////Recipe categories list//////////
  List<FoodCategoriesModle> recipeCategoriesList = [];
  late FoodCategoriesModle recipeCategoriesModle;
  Future<void> getrecipeCategoriesList() async {
    List<FoodCategoriesModle> newrecipeCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodCategories')
        .doc('khEy77DnG7mYdzTxCihg')
        .collection('recipe')
        .get();
    querySnapshot.docs.forEach((element) {
      var data = element.data() as Map<String, dynamic>;
      recipeCategoriesModle = FoodCategoriesModle(
        image: data['image'],
        name: data['name'],
        price: data['price'],
      );
      newrecipeCategoriesList.add(recipeCategoriesModle);
      recipeCategoriesList = newrecipeCategoriesList;
    });
  }

  get throwRecipeCategoriesList {
    return recipeCategoriesList;
  }

  ///////////////Pizza categories list//////////
  List<FoodCategoriesModle> pizzaCategoriesList = [];
  late FoodCategoriesModle pizzaCategoriesModle;
  Future<void> getPizzaCategoriesList() async {
    List<FoodCategoriesModle> newPizzaCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodCategories')
        .doc('khEy77DnG7mYdzTxCihg')
        .collection('pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      var data = element.data() as Map<String, dynamic>;
      pizzaCategoriesModle = FoodCategoriesModle(
        image: data['image'],
        name: data['name'],
        price: data['price'],
      );
      newPizzaCategoriesList.add(pizzaCategoriesModle);
      pizzaCategoriesList = newPizzaCategoriesList;
    });
  }

  get throwPizzaCategoriesList {
    return pizzaCategoriesList;
  }

  ///////////////Drink categories list//////////
  List<FoodCategoriesModle> drinkCategoriesList = [];
  late FoodCategoriesModle drinkCategoriesModle;
  Future<void> getDrinkCategoriesList() async {
    List<FoodCategoriesModle> newDrinkCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodCategories')
        .doc('khEy77DnG7mYdzTxCihg')
        .collection('drink')
        .get();
    querySnapshot.docs.forEach((element) {
      var data = element.data() as Map<String, dynamic>;
      drinkCategoriesModle = FoodCategoriesModle(
        image: data['image'],
        name: data['name'],
        price: data['price'],
      );
      newDrinkCategoriesList.add(drinkCategoriesModle);
      drinkCategoriesList = newDrinkCategoriesList;
    });
  }

  get throwDrinkCategoriesList {
    return drinkCategoriesList;
  }

/////////////add to cart ////////////
  List<CartModle> cartList = [];
  List<CartModle> newCartList = [];
  late CartModle cartModle;
  void addToCart({
    required String image,
    required String name,
    required int price,
    required int quantity,
  }) {
    cartModle = CartModle(
      image: image,
      name: name,
      price: price,
      quantity: quantity,
    );
    newCartList.add(cartModle);
    cartList = newCartList;
  }

  get throwCartList {
    return cartList;
  }

  int totalprice() {
    int total = 0;
    cartList.forEach((element) {
      total += element.price * element.quantity;
    });
    return total;
  }

  late int deleteIndex;
  void getDeleteIndex(int index) {
    deleteIndex = index;
  }

  void delete() {
    cartList.removeAt(deleteIndex);
    update();
  }
}
