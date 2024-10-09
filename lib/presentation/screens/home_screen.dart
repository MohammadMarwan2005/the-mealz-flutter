import 'package:bloc_state_management/data/api_service/api_service.dart';
import 'package:bloc_state_management/data/model/all_areas_response.dart';
import 'package:bloc_state_management/data/model/all_categories_response.dart';
import 'package:bloc_state_management/data/model/all_ingredients_response.dart';
import 'package:bloc_state_management/presentation/cubit/all_areas/all_areas_cubit.dart';
import 'package:bloc_state_management/presentation/cubit/all_categories/all_categories_dart_cubit.dart';
import 'package:bloc_state_management/presentation/cubit/all_ingredients/all_ingredients_cubit.dart';
import 'package:bloc_state_management/presentation/cubit/meals_by_area/meals_by_area_cubit.dart';
import 'package:bloc_state_management/presentation/cubit/meals_by_ingredient/meals_by_ingredient_cubit.dart';
import 'package:bloc_state_management/presentation/cubit/meals_by_category/meals_by_category_dart_cubit.dart';
import 'package:bloc_state_management/presentation/screens/all_areas_screen.dart';
import 'package:bloc_state_management/presentation/screens/all_categories_screen.dart';
import 'package:bloc_state_management/presentation/screens/all_ingredients_screen.dart';
import 'package:bloc_state_management/presentation/screens/category_details_screen.dart';
import 'package:bloc_state_management/presentation/screens/ingredient_details_screen.dart';
import 'package:bloc_state_management/presentation/screens/meal_details_screen.dart';
import 'package:bloc_state_management/presentation/screens/search_screen.dart';
import 'package:bloc_state_management/presentation/widgets/meals_carousel.dart';
import 'package:bloc_state_management/presentation/widgets/meals_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_state_management/presentation/screens/area_details_screen.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  void _loadAll() {
    context.read<AllCategoriesDartCubit>().getAllCategories();
    context.read<AllIngredientsCubit>().getAllIngredients();
    context.read<AllAreasCubit>().getAllAreas();
  }
  @override
  void initState() {
    super.initState();
    // 2: requesting the data of the cubit.
    _loadAll();
  }

  List<Widget> homeScreenWidgets(BuildContext context) {
    return [
      // 3: showing the data using blocBuilder...
      BlocBuilder<AllCategoriesDartCubit, AllCategoriesDartState>(
        builder: (context, state) {
          debugPrint("runtime type: ${state.runtimeType}");
          switch (state) {
            case AllCategoriesIsLoading _:
              return const Padding(
                padding: EdgeInsets.all(32.0),
                child: Center(child: CircularProgressIndicator()),
              );
            case AllCategoriesError _:
              return Text("Something Went Wrong: ${state.message}");
            case AllCategoriesLoaded _:
              return MealsCarousel(
                  title: "Categories",
                  items: state.loadedCategories.map<Widget>(
                    (category) {
                      return Padding(
                          padding: const EdgeInsets.all(16),
                          child: MealsCard(
                              fit: BoxFit.scaleDown,
                              image: Image.network(category.strCategoryThumb!),
                              title: category.strCategory!,
                              onClick: () {
                                navigateToCategoryDetails(context, category);
                              }));
                    },
                  ).toList(),
                  onSeeAllPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => AllCategoriesScreen(
                                categories: state.loadedCategories,
                                onCategoryClick: navigateToCategoryDetails)));
                  });
            default:
              return const Placeholder();
          }
        },
      ),

      BlocBuilder<AllIngredientsCubit, AllIngredientsState>(
          builder: (context, state) {
        switch (state) {
          case AllIngredientsIsLoading _:
            return const Padding(
              padding: EdgeInsets.all(32.0),
              child: Center(child: CircularProgressIndicator()),
            );
          case AllIngredientsError _:
            return Text("Something Went Wrong: ${state.message}");
          case AllIngredientsLoaded _:
            return MealsCarousel(
                title: "Ingredients",
                items: state.loadedIngredients.map<Widget>(
                  (ingredient) {
                    return Padding(
                        padding: const EdgeInsets.all(16),
                        child: MealsCard(
                            fit: BoxFit.scaleDown,
                            image: Image.network(ingredient.smallImageUrl),
                            title: ingredient.name,
                            onClick: () {
                              navigateToIngredientScreen(context, ingredient);
                            }));
                  },
                ).toList(),
                onSeeAllPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AllIngredientsScreen(
                          ingredients: state.loadedIngredients,
                          onIngredientClick: (ingredient) {
                            navigateToIngredientScreen(context, ingredient);
                          });
                    },
                  ));
                });
          default:
            return const Placeholder();
        }
      }),
      BlocBuilder<AllAreasCubit, AllAreasState>(
        builder: (context, state) {
          switch (state) {
            case AllAreasIsLoading _:
              return const Padding(
                padding: EdgeInsets.all(32.0),
                child: Center(child: CircularProgressIndicator()),
              );
            case AllAreasError _:
              return Text("Something Went Wrong: ${state.message}");
            case AllAreasLoaded _:
              return MealsCarousel(
                  title: "Areas",
                  items: state.loadedAreas.map<Widget>(
                    (area) {
                      return Padding(
                          padding: const EdgeInsets.all(16),
                          child: MealsCard(
                              fit: BoxFit.scaleDown,
                              image: getAreaImage(area),
                              title: area.name,
                              onClick: () {
                                navigateToAreaScreen(context, area);
                              }));
                    },
                  ).toList(),
                  onSeeAllPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllAreasScreen(
                              areas: state.loadedAreas,
                              onAreaClicked: (area) {
                                navigateToAreaScreen(context, area);
                              }),
                        ));
                  });
            default:
              return const Placeholder();
          }
        },
      )
      //
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            showSnackBar(context, "Not implemented yet!");
          }, icon: const Icon(Icons.menu)),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
          title: SvgPicture.asset("assets/svg/app_bar_logo.svg"),
          // Text("TheMealz with Bloc")
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: IconButton(
                  onPressed: () {
                    navigateToSearchScreen(context);
                  },
                  icon: const Icon(Icons.search)),
            )
          ],
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              _loadAll();
              return;
            },
            child: ListView.builder(
              itemCount: homeScreenWidgets(context).length,
              itemBuilder: (context, index) {
                final widgets = homeScreenWidgets(context);
                return widgets[index];
              },
            )));
  }
}

void navigateToCategoryDetails(
    BuildContext context, CategoryNetworkModel category) {
  context.read<MealsByCategoryDartCubit>().getMeals(category.strCategory!);
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => CategoryDetailsScreen(category: category)),
  );
}

void navigateToIngredientScreen(
    BuildContext context, IngredientDomainModel ingredient) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BlocProvider<MealsByIngredientCubit>(
                create: (context) => MealsByIngredientCubit(ApiService()),
                child: IngredientDetailsScreen(
                  ingredient: ingredient,
                ),
              )));
}

void navigateToAreaScreen(
  BuildContext context,
  AreaDomainModel area,
) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider<MealsByAreaCubit>(
          create: (context) => MealsByAreaCubit(ApiService()),
          child: AreaDetailsScreen(area: area),
        ),
      ));
}

void navigateToSearchScreen(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const SearchScreen()));
}

Image getAreaImage(AreaDomainModel area) => ((area.name == "Unknown")
    ? Image.asset("assets/img/error_img.png")
    : Image.network(area.imageUrl));
