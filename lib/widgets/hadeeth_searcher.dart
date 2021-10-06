import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HadeethSearcher extends StatefulWidget {
  const HadeethSearcher({Key? key}) : super(key: key);

  @override
  _HadeethSearcherState createState() => _HadeethSearcherState();
}

class _HadeethSearcherState extends State<HadeethSearcher> {
  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        border: const Border(
          bottom: BorderSide(color: CupertinoColors.systemGrey4),
        ),
      ),
      child: CupertinoTextField(
        controller: _searchTextController,
        autocorrect: true,
        onChanged: (String text) {
          setState(() {});
        },
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        prefix: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            CupertinoIcons.search,
            color: Colors.grey[700],
          ),
        ),
        placeholder: 'Поиск хадисов...',
        style: TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 18,
          color: Colors.grey[800],
        ),
        cursorColor: Colors.grey[700],
        clearButtonMode: OverlayVisibilityMode.editing,
      ),
    );
  }
}
