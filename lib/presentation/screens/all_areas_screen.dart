import 'package:bloc_state_management/data/model/all_areas_response.dart';
import 'package:bloc_state_management/presentation/screens/dynamic_grid_screen.dart';
import 'package:bloc_state_management/presentation/screens/home_screen.dart';
import 'package:bloc_state_management/presentation/widgets/meals_card.dart';
import 'package:flutter/material.dart';

class AllAreasScreen extends StatelessWidget {
  final List<AreaDomainModel> areas;
  final void Function(AreaDomainModel area) onAreaClicked;
  const AllAreasScreen(
      {super.key, required this.areas, required this.onAreaClicked});

  @override
  Widget build(BuildContext context) {
    return DynamicGridScreen(
        title: "All Ingredients",
        items: areas.map((area) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: MealsCard(
              fit: BoxFit.scaleDown,
              image: getAreaImage(area),
              title: area.name,
              onClick: () {
                onAreaClicked(area);
              },
            ),
          );
        }).toList());
  }
}
