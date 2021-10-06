import 'package:flutter/material.dart';
import 'package:hadith_40/widgets/hadeeth_list_item.dart';

class HadeethList extends StatelessWidget {
  const HadeethList({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return HadeethListItem(item: snapshot.data![index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}