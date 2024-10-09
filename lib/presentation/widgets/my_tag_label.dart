import 'package:flutter/material.dart';

class MyTagLabel extends StatelessWidget {
  final Icon icon;
  final String title;
  final void Function() onClick;
  const MyTagLabel(
      {super.key,
      required this.icon,
      required this.title,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 100),
          child: Ink(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(24)),
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: onClick,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [icon, const SizedBox(height: 8), Text(title)],
                ),
              ),
            ),
          ),
        ));
  }
}
