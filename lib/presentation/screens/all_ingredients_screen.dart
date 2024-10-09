import 'package:bloc_state_management/data/model/all_ingredients_response.dart';
import 'package:bloc_state_management/presentation/screens/dynamic_grid_screen.dart';
import 'package:bloc_state_management/presentation/screens/home_screen.dart';
import 'package:bloc_state_management/presentation/widgets/meals_card.dart';
import 'package:flutter/material.dart';

class AllIngredientsScreen extends StatelessWidget {
  final List<IngredientDomainModel> ingredients;
  final void Function(IngredientDomainModel ingredient) onIngredientClick;

  const AllIngredientsScreen(
      {super.key, required this.ingredients, required this.onIngredientClick});

  @override
  Widget build(BuildContext context) {
    return DynamicGridScreen(
        title: "All Ingredients",
        items: ingredients.map((ingredient) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: MealsCard(
              fit: BoxFit.scaleDown,
              image: Image.network(ingredient.hdImageUrl),
              title: ingredient.name,
              onClick: () {
                navigateToIngredientScreen(context, ingredient);
              },
            ),
          );
        }).toList());
  }
}
