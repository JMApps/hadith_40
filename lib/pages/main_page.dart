import 'package:flutter/material.dart';
import 'package:hadith_40/pages/bookmark_hadeeth_list.dart';
import 'package:hadith_40/pages/main_hadeeth_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _mainLists = const [
    MainHadeethList(),
    BookmarkHadeethList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainLists[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted), label: 'Хадисы'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), label: 'Избранное'),
        ],
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
