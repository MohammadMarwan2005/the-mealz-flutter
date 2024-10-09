import 'package:flutter/material.dart';

class MyChip extends StatelessWidget {
  final String title;
  final IconData iconData;
  final void Function() onClick;
  const MyChip(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      side: BorderSide(color: Theme.of(context).colorScheme.primary),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          )
        ],
      ),
      onPressed: onClick,
    );
  }
}
