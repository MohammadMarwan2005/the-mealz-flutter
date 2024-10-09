import 'package:bloc_state_management/data/model/meals_by_category_response.dart';
import 'package:bloc_state_management/presentation/screens/home_screen.dart';
import 'package:bloc_state_management/presentation/screens/meal_details_screen.dart';
import 'package:bloc_state_management/presentation/widgets/meals_card.dart';
import 'package:bloc_state_management/presentation/widgets/my_sliver_app_bar.dart';
import 'package:flutter/material.dart';

class DynamicDetailsScreen extends StatefulWidget {
  final String title;
  final String imageUrl;
  final bool provideImage;
  final Image? providedImage;
  final String about;
  final bool hasAbout;
  final String gridTitle;
  final List<Meal> meals;

  const DynamicDetailsScreen(
      {super.key,
      required this.title,
      required this.imageUrl,
      this.about = "",
      required this.hasAbout,
      required this.meals,
      required this.gridTitle,
      this.provideImage = false,
      this.providedImage});

  @override
  State<DynamicDetailsScreen> createState() => _DynamicDetailsScreenState();
}

class _DynamicDetailsScreenState extends State<DynamicDetailsScreen> {
  int maxLines = 5;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        MySliverAppBar(
          title: widget.title,
          image: widget.provideImage
              ? widget.providedImage!
              : Image.network(
                  widget.imageUrl,
                  fit: BoxFit.scaleDown,
                  height: 500,
                ),
        ),
        // I want to add here a title text: About
        if (widget.hasAbout)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child:
                  Text("About", style: Theme.of(context).textTheme.titleLarge),
            ),
          ),
        if (widget.hasAbout)
          SliverToBoxAdapter(
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                setState(() {
                  maxLines = (maxLines == 5) ? 1000 : 5;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                child: Text(
                  widget.about,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 8),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(widget.gridTitle,
                style: Theme.of(context).textTheme.titleLarge),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),
        SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: MealsCard(
                    image: Image.network(
                      // here you can add /preview in the end...
                      widget.meals[index].strMealThumb!,
                      fit: BoxFit.cover,
                      colorBlendMode: BlendMode.difference,
                    ),
                    fit: BoxFit.cover,
                    title: widget.meals[index].strMeal!,
                    onClick: () {
                      debugPrint(widget.meals[index].idMeal);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MealDetailsScreen(
                                  mealId:
                                      int.parse(widget.meals[index].idMeal!))));
                      // todo get the full meal details, and navigate to the meals details screen...
                    }),
              );
            }, childCount: widget.meals.length),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300))
      ],
    ));
  }
}
