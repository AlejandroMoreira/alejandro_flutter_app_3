import 'file:///C:/Users/user/Desktop/AlejandroMoreira/Cosas_de_Flutter/proyectos/alejandro_flutter_app_3/lib/views/category_meals_view.dart';
import 'package:flutter/material.dart';

import 'views/category_view.dart';

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
              headline1: TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        "/": (_) => CategoryView(), //home
        "/categories-meals": (_) => CategoryMealsView(),
      },
    );
  }
}
