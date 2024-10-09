import 'package:bloc_state_management/data/model/all_areas_response.dart';
import 'package:bloc_state_management/data/model/all_ingredients_response.dart';
import 'package:bloc_state_management/data/model/full_meal_response.dart';
import 'package:bloc_state_management/presentation/cubit/full_meal_details/full_meal_details_cubit.dart';
import 'package:bloc_state_management/presentation/screens/home_screen.dart';
import 'package:bloc_state_management/presentation/widgets/ingredient_item.dart';
import 'package:bloc_state_management/presentation/widgets/my_chip.dart';
import 'package:bloc_state_management/presentation/widgets/my_sliver_app_bar.dart';
import 'package:bloc_state_management/presentation/widgets/my_tag_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'meal_details_screen_by_meal_model.dart';

class MealDetailsScreen extends StatefulWidget {
  final bool usingId;
  final int mealId;
  final FullMealDomainModel? meal;
  const MealDetailsScreen({super.key, required this.mealId, this.usingId = true, this.meal});

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FullMealDetailsCubit>().getFullMealById(widget.mealId);
  }

  @override
  Widget build(BuildContext context) {
    return widget.usingId ? BlocBuilder<FullMealDetailsCubit, FullMealDetailsState>(
      builder: (context, state) {
        switch (state) {
          case FullMealDetailsIsLoading _:
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          case FullMealDetailsLoaded _:
            debugPrint(state.loadedMeal.ingredients.toString());
            return MealDetailsScreenByMealModel(meal: state.loadedMeal);
          case FullMealDetailsError _:
            return const Scaffold(
                body: Center(child: Text("Something went wrong")));
          default:
            return const Placeholder();
        }
      },
    ) : MealDetailsScreenByMealModel(meal: widget.meal!);
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(8.0),
    padding: const EdgeInsets.all(16.0),
    content: Text(message),
  ));
}

