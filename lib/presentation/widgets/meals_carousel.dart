import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MealsCarousel extends StatelessWidget {
  final Function() onSeeAllPressed;
  final String title;
  final List<Widget> items;
  const MealsCarousel(
      {super.key,
      required this.onSeeAllPressed,
      required this.items,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              TextButton(
                  onPressed: onSeeAllPressed, child: const Text("See All"))
            ],
          ),
        ),
        ConstrainedBox(
          constraints:
              const BoxConstraints(maxHeight: 500, minWidth: double.infinity),
          child: CarouselSlider(
              items: items
                  .map((e) => ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxWidth: 400, maxHeight: 500),
                      child: e))
                  .toList(),
              options: CarouselOptions(
                  autoPlayInterval: const Duration(milliseconds: 1500),
                  // aspectRatio:
                  //     MediaQuery.of(context).orientation == Orientation.portrait
                  //         ? 1.4
                  //         : 3,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.5)),
        ),
      ],
    );
  }
}
