import 'package:flutter/material.dart';
import 'package:hadith_40/pages/bookmark_hadeeth_list.dart';
import 'package:hadith_40/pages/main_hadeeth_list.dart';
import 'package:hadith_40/provider/navigator_index_state.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final List<Widget> _mainLists = [
    MainHadeethList(),
    const BookmarkHadeethList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainLists[context.read<NavigatorIndexState>().getSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted), label: 'Хадисы'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), label: 'Избранное'),
        ],
        selectedItemColor: Colors.grey[700],
        unselectedItemColor: Colors.grey,
        currentIndex: context.read<NavigatorIndexState>().getSelectedIndex,
        onTap: context.watch<NavigatorIndexState>().currentSelectedIndex,
      ),
    );
  }
}