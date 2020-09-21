import 'package:alejandroflutterapp3/widgets/meal_item_widget.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class CategoryMealsView extends StatelessWidget {
//  final String categoryId;
//  final String categoryTitle;
//
//  const CategoryMealsView(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = args["title"];
    final categoryId = args["id"];

    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItemWidget(
                categoryMeals[index].title,
                categoryMeals[index].imageUrl,
                categoryMeals[index].duration,
                categoryMeals[index].complexity,
                categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
