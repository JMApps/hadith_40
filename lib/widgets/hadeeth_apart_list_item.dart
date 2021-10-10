import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hadith_40/model/hadeeth_apart_item.dart';
import 'package:hadith_40/provider/hadeeth_settings_state.dart';
import 'package:provider/provider.dart';

class HadeethApartListItem extends StatefulWidget {
  const HadeethApartListItem({Key? key, required this.item}) : super(key: key);

  final HadeethApartItem item;

  @override
  _HadeethApartListItemState createState() => _HadeethApartListItemState();
}

class _HadeethApartListItemState extends State<HadeethApartListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${widget.item.hadeethArabic}',
        style: TextStyle(
          fontSize: context.watch<HadeethSettingsState>().getTextSizeCount + 3,
          fontFamily: 'Arabic',
        ),
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.start,
      ),
      subtitle: Html(
        data: '${widget.item.hadeethTranslation}',
        style: {
          '#': Style(
            fontSize: FontSize(context.watch<HadeethSettingsState>().getTextSizeCount),
            textAlign: TextAlign.end,
          ),
        },
      ),
    );
  }
}
