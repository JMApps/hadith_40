import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPlayer extends StatelessWidget {
  const MainPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        IconButton(
          icon: Icon(
            CupertinoIcons.play,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {},
        ),
        Expanded(
          child: Slider(
            value: 0,
            onChanged: (value) => 0,
            thumbColor: Colors.white,
            activeColor: Colors.blue[300],
            inactiveColor: Colors.white,
          ),
        ),
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
