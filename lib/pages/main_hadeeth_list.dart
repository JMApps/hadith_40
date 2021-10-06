import 'package:flutter/material.dart';

class MainHadeethList extends StatefulWidget {
  const MainHadeethList({Key? key}) : super(key: key);

  @override
  _MainHadeethListState createState() => _MainHadeethListState();
}

class _MainHadeethListState extends State<MainHadeethList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: const Text(
          '40 хадисов',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey[700],
      ),
      body: Container(
        color: Colors.grey[200],
      ),
    );
  }
}
