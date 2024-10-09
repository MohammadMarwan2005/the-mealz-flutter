import 'package:flutter/material.dart';

class MealsCard extends StatelessWidget {
  final Image image;
  final String title;
  final Function() onClick;
  final BoxFit fit;

  const MealsCard(
      {super.key,
      required this.image,
      required this.title,
      required this.onClick,
      this.fit = BoxFit.fill});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inversePrimary,
        borderRadius: BorderRadius.circular(32),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(32),
        onTap: onClick,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  image: DecorationImage(image: image.image, fit: fit),
                ),
              ),
            ),
            const Expanded(child: SizedBox(height: 16)),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 19),
                ),
              ),
            ),
            const Expanded(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
