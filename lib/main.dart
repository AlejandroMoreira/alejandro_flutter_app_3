import 'package:flutter/material.dart';

import './views/category_meals_view.dart';
import 'views/category_view.dart';
import 'views/meal_detail_view.dart';
import 'views/tabs_view.dart';
import 'views/filters_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
//                decoration: TextDecoration.underline
              ),
              headline5: TextStyle(
                  fontSize: 22,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
        focusColor: Colors.yellow,
        bottomAppBarColor: Colors.white,
      ),
      routes: {
        "/": (_) => TabsView(), //home
        "/categories-meals": (_) => CategoryMealsView(),
        "/categories-meals-details": (_) => MealDetailView(),
        "/draw-filters-view": (_) => FiltersView(),
      },
      //Si trata de acceder a una ruta que no existe devuelve CategoryView
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoryView(),
        );
      },
      //Si onGenerateRoute falla esta es la última opotunidad antes de crashear
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoryView(),
        );
      },
    );
  }
}
