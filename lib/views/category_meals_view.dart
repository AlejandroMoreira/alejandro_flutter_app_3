import 'package:flutter/material.dart';

import '../modules/meal.dart';
import '../widgets/meal_item_widget.dart';

class CategoryMealsView extends StatefulWidget {

  final List<Meal> avaliableMeals;

  CategoryMealsView(this.avaliableMeals);

//  final String categoryId;
//  final String categoryTitle;
//
//  const CategoryMealsView(this.categoryId, this.categoryTitle);

  @override
  _CategoryMealsViewState createState() => _CategoryMealsViewState();
}

class _CategoryMealsViewState extends State<CategoryMealsView> {
  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    //Cuand se borre algo de la lista
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = args["title"];
    final categoryId = args["id"];

    displayedMeals = widget.avaliableMeals.where((element) {
      return element.categories.contains(categoryId);
    }).toList();

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItemWidget(
              displayedMeals[index].title,
              displayedMeals[index].imageUrl,
              displayedMeals[index].duration,
              displayedMeals[index].complexity,
              displayedMeals[index].affordability,
              displayedMeals[index].id,
              _removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
