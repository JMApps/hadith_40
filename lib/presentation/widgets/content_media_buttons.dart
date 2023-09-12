import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentMediaButtons extends StatelessWidget {
  const ContentMediaButtons({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilledButton.tonal(
          onPressed: () {
            pageController.previousPage(
              duration: const Duration(milliseconds: 750),
              curve: Curves.easeOutSine,
            );
          },
          child: const Icon(
            CupertinoIcons.chevron_back,
          ),
        ),
        FilledButton.tonal(
          onPressed: () {
            pageController.nextPage(
              duration: const Duration(milliseconds: 750),
              curve: Curves.easeOutSine,
            );
          },
          child: const Icon(
            CupertinoIcons.chevron_forward,
          ),
        ),
      ],
    );
  }
}
