import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  final String title;
  final Widget image;
  final bool floating;
  const MySliverAppBar(
      {super.key,
      required this.title,
      required this.image,
      this.floating = true});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(48),
        bottomRight: Radius.circular(48),
      )),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      pinned: true,
      floating: floating,
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        background: image,
      ),
    );
  }
}
