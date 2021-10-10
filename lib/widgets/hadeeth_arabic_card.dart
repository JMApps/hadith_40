import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hadith_40/provider/hadeeth_settings_state.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HadeethArabic extends StatelessWidget {
  const HadeethArabic({Key? key, required this.hadeethArabic})
      : super(key: key);

  final String hadeethArabic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 8),
      child: Html(
        data: hadeethArabic,
        style: {
          '#': Style(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            fontSize: FontSize(context.watch<HadeethSettingsState>().getTextSizeCount + 3),
            fontFamily: 'Arabic',
            direction: TextDirection.rtl,
            textAlign: TextAlign.justify,
            lineHeight: LineHeight.rem(1.3),
          ),
          'small': Style(
            fontSize: FontSize(context.watch<HadeethSettingsState>().getTextSizeCount - 5),
            color: Colors.black54,
            direction: TextDirection.rtl,
          ),
        },
      ),
    );
  }

  Future<int> textSizeCount() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getInt('key_text_size') ?? 18;
  }
}
