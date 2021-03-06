import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItemWidget(this.title, this.color, this.id);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      "/categories-meals",
      arguments: {"id": id, "title": title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(this.title, style: Theme.of(context).textTheme.headline6),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
