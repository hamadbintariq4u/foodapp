// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task/Screens/Widget/home_page.dart';
import 'package:task/Screens/Widget/item_container.dart';
import 'package:task/Screens/detail_page.dart';
import 'package:task/models/food_categories_model.dart';

class Categories extends StatelessWidget {
  List<FoodCategoriesModle> list = [];
  Categories({required this.list});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (contet) => HomePage()));
          },
        ),
      ),
      body: GridView.count(
          shrinkWrap: false,
          primary: false,
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: list
              .map(
                (e) => itemContainer(
                  image: e.image,
                  price: e.price,
                  name: e.name,
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
                ),
              )
              .toList()),
    );
  }
}
