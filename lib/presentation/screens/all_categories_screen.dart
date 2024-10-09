import 'package:bloc_state_management/constants/constants.dart';
import 'package:bloc_state_management/data/model/all_categories_response.dart';
import 'package:bloc_state_management/presentation/screens/dynamic_grid_screen.dart';
import 'package:bloc_state_management/presentation/widgets/meals_card.dart';
import 'package:flutter/material.dart';

class AllCategoriesScreen extends StatefulWidget {
  final List<CategoryNetworkModel> categories;
  final void Function(BuildContext context, CategoryNetworkModel category)
      onCategoryClick;

  const AllCategoriesScreen(
      {super.key, required this.categories, required this.onCategoryClick});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    // title
    // items
    return DynamicGridScreen(
      title: "AllCategories",
      items: widget.categories.map(
        (category) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: MealsCard(
              fit: BoxFit.scaleDown,
              image: Image.network(category.strCategoryThumb!),
              title: category.strCategory!,
              onClick: () {
                widget.onCategoryClick(context, category);
              },
            ),
          );
        },
      ).toList(),
    );
  }
}
