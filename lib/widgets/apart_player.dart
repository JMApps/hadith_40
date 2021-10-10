import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApartPlayer extends StatelessWidget {
  const ApartPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        const SizedBox(width: 60),
        IconButton(
          icon: const Icon(
            CupertinoIcons.backward_end_alt,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            CupertinoIcons.play,
            color: Colors.white,
            size: 35,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            CupertinoIcons.forward_end_alt,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {},
        ),
        const Spacer(),
        IconButton(
          icon: Icon(
            CupertinoIcons.arrow_2_squarepath,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {},
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}