import 'package:bloc_state_management/data/model/full_meal_response.dart';
import 'package:bloc_state_management/presentation/cubit/full_meal_details/full_meal_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'meal_details_screen_by_meal_model.dart';

class MealDetailsScreen extends StatefulWidget {
  final bool usingId;
  final int mealId;
  final FullMealDomainModel? meal;
  final void Function(BuildContext context)? onMealRendered;

  const MealDetailsScreen(
      {super.key,
      required this.mealId,
      this.usingId = true,
      this.meal,
      this.onMealRendered});

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.usingId) {
      context.read<FullMealDetailsCubit>().getFullMealById(widget.mealId);
    }
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if(widget.onMealRendered != null) {
          widget.onMealRendered!(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.usingId
        ? BlocBuilder<FullMealDetailsCubit, FullMealDetailsState>(
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
          )
        : MealDetailsScreenByMealModel(meal: widget.meal!);
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
