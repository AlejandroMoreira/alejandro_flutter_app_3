import 'package:alejandroflutterapp3/widgets/meal_item_widget.dart';
import 'package:flutter/material.dart';

import '../modules/meal.dart';

class FavoritesView extends StatelessWidget {
  final List<Meal> favoritesMeals;

  FavoritesView(this.favoritesMeals);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return Center(
        child: Text("You have no favortites yet - Start adding some!"),
      );
    }else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItemWidget(
            favoritesMeals[index].title,
            favoritesMeals[index].imageUrl,
            favoritesMeals[index].duration,
            favoritesMeals[index].complexity,
            favoritesMeals[index].affordability,
            favoritesMeals[index].id,
          );
        },
        itemCount: favoritesMeals.length,
      );
    }
  }
}
