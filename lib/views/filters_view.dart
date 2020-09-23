import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';

class FiltersView extends StatefulWidget {
  final Function setFilters;
  final Map<String, bool> currentFilters;

  FiltersView(this.setFilters, this.currentFilters);

  @override
  _FiltersViewState createState() => _FiltersViewState();
}

class _FiltersViewState extends State<FiltersView> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _glutenFree = widget.currentFilters["gluten"];
    _vegetarian = widget.currentFilters["vegetarian"];
    _vegan = widget.currentFilters["vegan"];
    _glutenFree = widget.currentFilters["gluten"];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text('Filters saved'),
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  label: "OK",
                  onPressed:(){
                  }
                ),
              ));

              final seletedFilters = {
                "gluten": _glutenFree,
                "lactose": _lactoseFree,
                "vegan": _vegan,
                "vegetarian": _vegetarian,
              };
              widget.setFilters(seletedFilters);
            },
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile("Gluten Free",
                    "Only include gluten free meals.", _glutenFree, (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
                _buildSwitchListTile("Lactose Free",
                    "Only include lactose free meals.", _lactoseFree, (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
                _buildSwitchListTile(
                    "Vegetrian", "Only include vegetarian meals.", _vegetarian,
                    (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                }),
                _buildSwitchListTile(
                    "Vegan", "Only include vegan meals.", _vegan, (value) {
                  setState(() {
                    _vegan = value;
                  });
                })
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchListTile _buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        value: currentValue,
        subtitle: Text(subtitle),
        onChanged: updateValue);
  }
}
