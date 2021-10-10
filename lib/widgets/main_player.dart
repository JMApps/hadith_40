import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPlayer extends StatelessWidget {
  const MainPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            CupertinoIcons.play,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        Expanded(
            child: Slider(
              value: 0,
              onChanged: (value) => 0,
              thumbColor: Colors.white,
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
            )),
        IconButton(
          icon: Icon(
            CupertinoIcons.arrow_2_squarepath,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}