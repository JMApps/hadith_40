import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '40 хадисов',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: Container(
        color: Colors.grey[100],
      ),
    );
  }
}
