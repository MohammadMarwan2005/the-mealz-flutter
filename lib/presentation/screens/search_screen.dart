import 'dart:async';

import 'package:bloc_state_management/presentation/cubit/search_cubit/search_result_cubit.dart';
import 'package:bloc_state_management/presentation/screens/meal_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/meals_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Search for a meal"),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 80),
            child: Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                child: SearchBar(
                  controller:
                      context.read<SearchResultCubit>().searchController,
                  onChanged: (keyword) {
                    if (timer?.isActive ?? false) timer!.cancel();
                    timer = Timer(
                      const Duration(milliseconds: 500),
                      () {
                        context
                            .read<SearchResultCubit>()
                            .getSearchResults(keyword);
                      },
                    );
                  },
                  hintText: "Search...",
                  leading: IconButton(
                      onPressed: () {
                        // todo
                      },
                      icon: const Icon(Icons.search)),
                  trailing: [
                    IconButton(
                        onPressed: () {
                          context
                              .read<SearchResultCubit>()
                              .searchController
                              .clear();
                          context
                              .read<SearchResultCubit>()
                              .getSearchResults("");
                        },
                        icon: const Icon(Icons.close))
                  ],
                )),
          ),
        ),
        body: BlocBuilder<SearchResultCubit, SearchResultState>(
          builder: (context, state) {
            switch (state) {
              case SearchResultLoaded _:
                return state.loadedMeals.isNotEmpty
                    ? GridView(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300),
                        children: state.loadedMeals.map(
                          (meal) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: MealsCard(
                                fit: BoxFit.scaleDown,
                                image: Image.network(meal.strMealThumb!),
                                title: meal.name!,
                                onClick: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MealDetailsScreen(
                                                usingId: false,
                                                mealId: -1,
                                                meal: meal,
                                              )));
                                },
                              ),
                            );
                          },
                        ).toList(),
                      )
                    : const Center(child: Text("No Meals Found!"));
              case SearchResultIsLoading _:
                return const Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              case SearchResultError _:
                return const Scaffold(
                    body: Center(child: Text("Sorry, something went wrong!")));
              case SearchResultInitial _:
                return const Scaffold(
                    body: Center(child: Text("Search for a meal!")));
              default:
                return const Placeholder();
            }
          },
        ));
  }
}

/*
* TextField(
              onChanged: (s) {},
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),*/
