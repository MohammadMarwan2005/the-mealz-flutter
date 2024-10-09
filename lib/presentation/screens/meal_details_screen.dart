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

class MealDetailsScreen extends StatefulWidget {
  final int mealId;
  const MealDetailsScreen({super.key, required this.mealId});

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
    return BlocBuilder<FullMealDetailsCubit, FullMealDetailsState>(
      builder: (context, state) {
        switch (state) {
          case FullMealDetailsIsLoading _:
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          case FullMealDetailsLoaded _:
            debugPrint(state.loadedMeal.ingredients.toString());
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                  body: CustomScrollView(
                slivers: [
                  MySliverAppBar(
                      floating: false,
                      title: state.loadedMeal.name!,
                      image: Padding(
                        padding: const EdgeInsets.all(100),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: Image.network(
                            state.loadedMeal.strMealThumb!,
                            fit: BoxFit.cover,
                            height: 500,
                          ),
                        ),
                      )),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Wrap(
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        children: [
                          ..._getLabelEntry(state.loadedMeal, context)
                              .map((e) => MyTagLabel(
                                    icon: e.icon,
                                    title: e.title,
                                    onClick: e.onClick,
                                  )),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: TabBar(
                        tabs: [
                          Tab(text: "Ingredients"),
                          Tab(text: "Instructions"),
                          Tab(text: "More"),
                        ],
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TabBarView(children: [
                        ListView.builder(
                          padding: const EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.loadedMeal.ingredients.length,
                          itemBuilder: (context, index) {
                            return IngredientItem(
                              title: state.loadedMeal.ingredients[index],
                              measure: state.loadedMeal.measures[index],
                              onClick: () {
                                // Failed: how to do that????
                                navigateToIngredientScreen(
                                    context,
                                    IngredientNetworkModel(
                                      idIngredient: "",
                                      strIngredient:
                                          state.loadedMeal.ingredients[index],
                                      strDescription: "",
                                      strType: "",
                                    ).toDomainModel());
                              },
                            );
                          },
                        ),
                        Text(state.loadedMeal.instructionsString!),
                        ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(0),
                          children: [
                            Row(children: [
                              MyChip(
                                title: "Resources",
                                iconData: Icons.attachment,
                                onClick: () {
                                  final url =
                                      Uri.parse(state.loadedMeal.resource!);
                                  launchUrl(url);
                                },
                              )
                            ]),
                            const SizedBox(height: 8),
                            Row(children: [
                              MyChip(
                                title: "Youtube Link",
                                iconData: Icons.ondemand_video_rounded,
                                onClick: () {
                                  if (state.loadedMeal.strYoutube != null) {
                                    launchUrl(Uri.parse(
                                        state.loadedMeal.strYoutube!));
                                  }
                                },
                              )
                            ]),
                          ],
                        ),
                      ]),
                    ),
                  )
                ],
              )),
            );
          case FullMealDetailsError _:
            return const Scaffold(
                body: Center(child: Text("Something went wrong")));
          default:
            return const Placeholder();
        }
      },
    );
  }

  List<LabelEntry> _getLabelEntry(
      FullMealDomainModel meal, BuildContext context) {
    final AreaDomainModel areaDomainModel =
        AreaNetwokModel(strArea: meal.areaString ?? "").toDomainModel();

    return [
      LabelEntry(
          title: meal.categoryString!,
          icon: const Icon(Icons.category),
          onClick: () {
            showSnackBar(context,
                "Sorry, meals can't be filtered using a category form here, \nit's a back-end problem (: \n (🥲 Category By Id! عجبك؟ الباك اند معندهوش انك تجيب ال)");
          }),
      LabelEntry(
        title: meal.areaString!,
        icon: const Icon(Icons.location_on),
        onClick: () {
          navigateToAreaScreen(context, areaDomainModel);
        },
      ),
      ...meal.tags.map(
        (tag) => LabelEntry(
            title: tag,
            icon: const Icon(Icons.tag),
            onClick: () {
              showSnackBar(
                  context, "Sorry, meals can't be filtred using tags...");
            }),
      )
    ];
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

class LabelEntry {
  final String title;
  final Icon icon;
  final void Function() onClick;

  LabelEntry({required this.title, required this.icon, required this.onClick});
}
