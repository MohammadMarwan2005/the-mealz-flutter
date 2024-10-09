import 'package:bloc_state_management/data/model/all_categories_response.dart';
import 'package:bloc_state_management/presentation/cubit/meals_by_category/meals_by_category_dart_cubit.dart';
import 'package:bloc_state_management/presentation/screens/dynamic_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final CategoryNetworkModel category;
  const CategoryDetailsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsByCategoryDartCubit, MealsByCategoryDartState>(
      builder: (context, state) {
        debugPrint("RuntimeType: ${state.runtimeType}");
        switch (state) {
          case MealsByCategoryLoaded _:
            return DynamicDetailsScreen(
                title: category.strCategory!,
                imageUrl: category.strCategoryThumb!,
                hasAbout: true,
                meals: state.loadedMeals,
                gridTitle: "Meals of ${category.strCategory!} category",
                about: category.strCategoryDescription!);
          case MealsByCategoryIsLoading _:
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          case MealsByCategoryError _:
            return const Scaffold(
                body: Center(child: Text("Sorry, something went wrong!")));
          default:
            return const Placeholder();
        }
      },
    );
  }
}
