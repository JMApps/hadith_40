import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/provider/search_data.dart';
import 'package:provider/provider.dart';

class HadeethSearcher extends StatelessWidget {
  const HadeethSearcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(35),
        ),
      ),
      child: CupertinoTextField(
        autocorrect: true,
        onChanged: (String text) {
          context.read<SearchData>().updateTextFieldData(text);
        },
        decoration: const BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        prefix: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            CupertinoIcons.search,
            color: Colors.grey[800],
          ),
        ),
        placeholder: 'Поиск хадисов...',
        placeholderStyle: const TextStyle(color: Colors.grey),
        style: TextStyle(color: Colors.grey[800]),
        clearButtonMode: OverlayVisibilityMode.editing,
      ),
    );
  }
}
