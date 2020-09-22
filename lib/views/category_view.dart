import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widgets/category_item_widget.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (e) => CategoryItemWidget(e.title, e.color,e.id),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
    );
  }
}
