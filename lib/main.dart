import 'package:bloc_state_management/data/api_service/api_service.dart';
import 'package:bloc_state_management/data/repo/all_categories_repo.dart';
import 'package:bloc_state_management/presentation/cubit/all_areas/all_areas_cubit.dart';
import 'package:bloc_state_management/presentation/cubit/all_categories/all_categories_dart_cubit.dart';
import 'package:bloc_state_management/presentation/cubit/all_ingredients/all_ingredients_cubit.dart';
import 'package:bloc_state_management/presentation/cubit/meals_by_ingredient/meals_by_ingredient_cubit.dart';
import 'package:bloc_state_management/presentation/cubit/full_meal_details/full_meal_details_cubit.dart';
import 'package:bloc_state_management/presentation/cubit/meals_by_category/meals_by_category_dart_cubit.dart';
import 'package:bloc_state_management/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiService apiService = ApiService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => FullMealDetailsCubit(apiService)),
          BlocProvider(
              create: (context) => AllCategoriesDartCubit(
                  AllCategoriesRepo(apiService: apiService))),
          BlocProvider(
              create: (context) => MealsByCategoryDartCubit(apiService)),
          BlocProvider(create: (context) => AllIngredientsCubit(apiService)),
          BlocProvider(create: (context) => MealsByIngredientCubit(apiService)),
          BlocProvider(create: (context) => AllAreasCubit(apiService))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFF8A5C2C)),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ));
  }
}
