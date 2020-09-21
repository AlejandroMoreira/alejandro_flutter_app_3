import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: DUMMY_CATEGORIES
          .map(
            (e) => CategoryItem(e.title, e.color),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
      ),
    );
  }
}
