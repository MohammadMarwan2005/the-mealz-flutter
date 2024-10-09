import 'package:bloc_state_management/constants/constants.dart';
import 'package:flutter/material.dart';

class DynamicGridScreen extends StatelessWidget {
  final String title;
  final List<Widget> items;
  const DynamicGridScreen(
      {super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("All Categories"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: GridView(
        gridDelegate: gridDelegate,
        children: items,
      ),
    );
  }
}
