import 'package:bloc_state_management/data/model/full_meal_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/model/all_areas_response.dart';
import '../../data/model/all_ingredients_response.dart';
import '../widgets/ingredient_item.dart';
import '../widgets/my_chip.dart';
import '../widgets/my_sliver_app_bar.dart';
import '../widgets/my_tag_label.dart';
import 'home_screen.dart';
import 'meal_details_screen.dart';

class MealDetailsScreenByMealModel extends StatelessWidget {
  final FullMealDomainModel meal;
  const MealDetailsScreenByMealModel({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: CustomScrollView(
            slivers: [
              MySliverAppBar(
                  floating: false,
                  title: meal.name!,
                  image: Padding(
                    padding: const EdgeInsets.all(100),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Image.network(
                        meal.strMealThumb!,
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
                      ..._getLabelEntry(meal, context)
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
                      itemCount: meal.ingredients.length,
                      itemBuilder: (context, index) {
                        return IngredientItem(
                          title: meal.ingredients[index],
                          measure: meal.measures[index],
                          onClick: () {
// Failed: how to do that????
                            navigateToIngredientScreen(
                                context,
                                IngredientNetworkModel(
                                  idIngredient: "",
                                  strIngredient:
                                  meal.ingredients[index],
                                  strDescription: "",
                                  strType: "",
                                ).toDomainModel());
                          },
                        );
                      },
                    ),
                    Text(meal.instructionsString!),
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
                              Uri.parse(meal.resource!);
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
                              if (meal.strYoutube != null) {
                                launchUrl(Uri.parse(
                                    meal.strYoutube!));
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




class LabelEntry {
  final String title;
  final Icon icon;
  final void Function() onClick;

  LabelEntry({required this.title, required this.icon, required this.onClick});
}