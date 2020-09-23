import 'package:flutter/material.dart';

import 'favorites_view.dart';
import 'category_view.dart';
import '../widgets/drawer_widget.dart';
import '../modules/meal.dart';

class TabsView extends StatefulWidget {
  final List<Meal> favoritesMeals;

  TabsView(this.favoritesMeals);

  @override
  _TabsViewState createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {

  List<Map<String, Object>> _views;

  int _selectedView = 0;
  Color selectedItemColor = Colors.blue;


  @override
  void initState() {
    _views = [
      {
        "page": CategoryView(),
        "title": "Categories",
      },
      {
        "page": FavoritesView(widget.favoritesMeals),
        "title": "Favorites",
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedView = index;
    });
  }

  void _colorSelectedItem(int index) {
    setState(() {
      switch (index) {
        case 0:
          selectedItemColor = Colors.yellow;
          break;
        case 1:
          selectedItemColor = Colors.red;
          break;
        default:
          selectedItemColor = Colors.white;
          print("Appbar Color Issue");
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //Cambiar color
    _colorSelectedItem(_selectedView);

    //Barra inferior
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              _views[_selectedView]["title"],
              style: TextStyle(
//            color: selectedItemColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            _selectedView == 0 ? Icon(Icons.category) : Icon(Icons.favorite),
          ],
        ),
      ),
      drawer: DrawerWidget(),
      body: _views[_selectedView]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).bottomAppBarColor,
        selectedItemColor: selectedItemColor,
        currentIndex: _selectedView,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorites"),
          ),
        ],
      ),
    );

    // Barra superior
//    return DefaultTabController(
//      length: 2,
//      initialIndex: 0,
//      child: Scaffold(
//        appBar: AppBar(
//          title: Text("Meals"),
//          bottom: TabBar(
//            tabs: [ //mismo orden que el body
//              Tab(icon: Icon(Icons.category),text: "Categories",),
//              Tab(icon: Icon(Icons.favorite),text: "Favorites"),
//            ],
//          ),
//        ),
//        body: TabBarView(
//          children: [
//            CategoryView(),
//            Favorites(),
//          ],
//        ),
//      ),
//    );
  }
}
