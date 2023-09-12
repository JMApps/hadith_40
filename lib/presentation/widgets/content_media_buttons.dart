import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentMediaButtons extends StatelessWidget {
  const ContentMediaButtons({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FilledButton(
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
        OutlinedButton(
          onPressed: () {},
          child: const Icon(
            CupertinoIcons.play_circle,
            size: 35,
          ),
        ),
        FilledButton(
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
