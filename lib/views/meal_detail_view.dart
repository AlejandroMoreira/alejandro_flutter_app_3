import 'package:alejandroflutterapp3/data/dummy_data.dart';
import 'package:alejandroflutterapp3/views/sanck_bar_widget.dart';
import 'package:flutter/material.dart';

class MealDetailView extends StatefulWidget {
  final Function toogleFavorite;
  final Function isFavorite;

  MealDetailView(this.toogleFavorite, this.isFavorite);

  @override
  _MealDetailViewState createState() => _MealDetailViewState();
}

class _MealDetailViewState extends State<MealDetailView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    Widget buildSectionTitle(BuildContext context, String title) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
      );
    }

    Widget buildContainer(Widget child) {
      return Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          child: child);
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
//                  color: Theme.of(context).accentColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# ${index + 1}"),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child:
              Icon(widget.isFavorite(mealId) ? Icons.star : Icons.star_border),
          onPressed: () {
            widget.toogleFavorite(mealId);
            scaffoldKey.currentState.showSnackBar(
              widget.isFavorite(mealId) ?
              SnackBarWidget("Element added to favorites").build(context):
              SnackBarWidget("Element remove from favorites").build(context),
            ); //Back button
          }),
    );
  }
}
