import 'package:flutter/material.dart';

import './views/category_meals_view.dart';
import 'modules/meal.dart';
import 'views/category_view.dart';
import 'views/meal_detail_view.dart';
import 'views/tabs_view.dart';
import 'views/filters_view.dart';
import 'data/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _avaliableMeals = DUMMY_MEALS;
  List<Meal> _favoritesMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _avaliableMeals = DUMMY_MEALS.where((element) {
        if (_filters["gluten"] && !element.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] && !element.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"] && !element.isVegan) {
          return false;
        }
        if (_filters["vegetarian"] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoritesMeals.indexWhere((element) => element.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoritesMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritesMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoritesMeals.any((element) => element.id == id);
  }

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
        "/": (_) => TabsView(_favoritesMeals), //home
        "/categories-meals": (_) => CategoryMealsView(_avaliableMeals),
        "/categories-meals-details": (_) => MealDetailView(_toggleFavorite,_isMealFavorite),
        "/draw-filters-view": (_) => FiltersView(_setFilters, _filters),
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
