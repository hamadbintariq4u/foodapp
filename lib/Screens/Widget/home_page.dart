// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/Screens/Widget/item_container.dart';
import 'package:task/Screens/categories.dart';
import 'package:task/Screens/detail_page.dart';

import 'package:task/models/categories_models.dart';
import 'package:task/models/food_categories_model.dart';
import 'package:task/models/food_modle.dart';
import 'package:task/provider/my_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final controll = Get.put(MyController());

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<CategoriesModle> burgerlist = [];
  List<CategoriesModle> recipelist = [];
  List<CategoriesModle> pizzalist = [];
  List<CategoriesModle> drinklist = [];
  List<CategoriesModle> alllist = [];
  List<FoodModle> singleFoodList = [];
  List<FoodCategoriesModle> burgerCategoriesList = [];
  List<FoodCategoriesModle> recipeCategoriesList = [];
  List<FoodCategoriesModle> pizzaCategoriesList = [];
  List<FoodCategoriesModle> drinkCategoriesList = [];

  Widget categoriesContainer({
    required String image,
    required String name,
    required VoidCallback ontap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            margin: EdgeInsets.only(left: 20.0),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image)),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget drawerItem({
    required String name,
    required IconData icon,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget burger() {
    return Row(
      children: burgerlist
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              ontap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: burgerCategoriesList,
                    ),
                  ),
                );
              }))
          .toList(),
    );
  }

////2nd
  Widget recipe() {
    return Row(
      children: recipelist
          .map((e) => categoriesContainer(
                image: e.image,
                name: e.name,
                ontap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          Categories(list: recipeCategoriesList),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }

  //3rd
  Widget pizza() {
    return Row(
      children: pizzalist
          .map(
            (e) => categoriesContainer(
              image: e.image,
              name: e.name,
              ontap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(list: pizzaCategoriesList),
                  ),
                );
              },
            ),
          )
          .toList(),
    );
  }

  /////4th
  Widget drink() {
    return Row(
      children: drinklist
          .map(
            (e) => categoriesContainer(
              image: e.image,
              name: e.name,
              ontap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(list: drinkCategoriesList),
                  ),
                );
              },
            ),
          )
          .toList(),
    );
  }

  /////5th
  Widget all() {
    return Row(
      children: alllist
          .map(
            (e) => categoriesContainer(
              image: e.image,
              name: e.name,
              ontap: () {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) => Categories(list: drinkCategoriesList),
                //   ),
                // );
              },
            ),
          )
          .toList(),
    );
  }

  bool loading = false;
  bool wait = true;
  final myController = MyController();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      await myController.getBurgerCategorie();
      await myController.getRecipeCategorie();
      await myController.getDrinkCategorie();
      await myController.getAllCategorie();
      await myController.getPizzaCategorie();
      await myController.getFoodList();
      await myController.getBurgerCategoriesList();
      await myController.getrecipeCategoriesList();
      await myController.getPizzaCategoriesList();
      await myController.getDrinkCategoriesList();
      burgerlist = myController.throwBurgerList;
      recipelist = myController.throwRecipeList;
      pizzalist = myController.throwPizzaList;
      drinklist = myController.throwDrinkList;
      alllist = myController.throwAllList;
      singleFoodList = myController.throwFoodModleList;
      burgerCategoriesList = myController.throwBurgerCategoriesList;
      recipeCategoriesList = myController.throwRecipeCategoriesList;
      drinkCategoriesList = myController.throwDrinkCategoriesList;
      pizzaCategoriesList = myController.throwPizzaCategoriesList;
      wait = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // loading = true;

    return GestureDetector(
      onLongPress: () async {
        setState(() {});
      },
      child: Scaffold(
        drawer: Drawer(
          child: Container(
            color: Color(0xff2b2b2b),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "images/background.jpg",
                        ),
                      ),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("images/profile.jpg"),
                    ),
                    accountName: Text("Hamad Tariq"),
                    accountEmail: Text("hamadbintariq4u@gmail.com"),
                  ),
                  drawerItem(icon: Icons.person, name: "Profile"),
                  drawerItem(icon: Icons.add_shopping_cart, name: "Cart"),
                  drawerItem(icon: Icons.shop, name: "Order"),
                  Divider(
                    thickness: 2,
                    color: Colors.white,
                  ),
                  ListTile(
                    leading: Text(
                      "Comunicate",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  drawerItem(icon: Icons.lock, name: "Change"),
                  drawerItem(icon: Icons.exit_to_app, name: "Log Out"),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("images/profile.jpg"),
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Food",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: Color(0xff3a3e3e),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  wait
                      ? CircularProgressIndicator(
                          color: Colors.deepOrange,
                        )
                      : Text(""),

                  all(),
                  burger(),
                  recipe(),
                  pizza(),
                  drink(),
                  // categoriesContainer(image: "images/1.png", title: "All"),
                  // categoriesContainer(image: "images/2.png", title: "Burger"),
                  // categoriesContainer(image: "images/3.png", title: "Recipie"),
                  // categoriesContainer(image: "images/4.png", title: "Pizza"),
                  // categoriesContainer(image: "images/5.png", title: "Drink"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 475,
              child: GridView.count(
                shrinkWrap: false,
                primary: false,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: singleFoodList
                    .map((e) => itemContainer(
                          name: e.name,
                          image: e.image,
                          price: e.price,
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  image: e.image,
                                  name: e.name,
                                  price: e.price,
                                ),
                              ),
                            );
                          },
                        ))
                    .toList(),
                // children: [
                //   itemContainer(
                //     name: "Burger",
                //     image: "images/2.png",
                //     prize: 12,
                //   ),
                //   itemContainer(
                //     name: "Burger",
                //     image: "images/2.png",
                //     prize: 12,
                //   ),
                //   itemContainer(
                //     name: "Burger",
                //     image: "images/2.png",
                //     prize: 12,
                //   ),
                //   itemContainer(
                //     name: "Burger",
                //     image: "images/2.png",
                //     prize: 12,
                //   ),
                // ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
