import 'package:flutter/material.dart';
import 'package:hadith_40/widgets/hadeeth_apart_list_item.dart';

class HadeethApartList extends StatefulWidget {
  const HadeethApartList({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  _HadeethApartListState createState() => _HadeethApartListState();
}

class _HadeethApartListState extends State<HadeethApartList> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: widget.snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return HadeethApartListItem(item: widget.snapshot.data![index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
