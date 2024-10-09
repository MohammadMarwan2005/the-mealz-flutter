import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final String title;
  final String measure;
  final void Function() onClick;

  const IngredientItem(
      {super.key,
      required this.title,
      required this.measure,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      leading: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleAvatar(
          radius: 23,
          child: Image.network(
              "https://www.themealdb.com/images/ingredients/$title-Small.png"),
        ),
      ),
      title: Text(title),
      trailing: Text(measure),
      onTap: onClick,
    );
  }
}
