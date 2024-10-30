import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../../domain/entities/hadith_entity.dart';
import '../state/content_index_state.dart';
import '../state/hadiths_state.dart';

class ShareHadithButton extends StatefulWidget {
  const ShareHadithButton({super.key});

  @override
  State<ShareHadithButton> createState() => _ShareHadithButtonState();
}

class _ShareHadithButtonState extends State<ShareHadithButton> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;
    return Consumer2<ContentIndexState, HadithsState>(
      builder: (context, contentIndex, hadithState, _) {
        return FutureBuilder<HadithEntity>(
          future: hadithState.fetchHadithById(
            tableName: locale.tableName,
            hadithId: contentIndex.getContentIndex,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final HadithEntity hadithModel = snapshot.data!;
              return IconButton.filledTonal(
                onPressed: () async {
                  final shareContent = await _hadithForShare(
                    hadithNumber: hadithModel.hadithNumber,
                    hadithArabic: hadithModel.hadithArabic,
                    hadithTranslation: hadithModel.hadithTranslation,
                  );
                  await Share.share(shareContent);
                },
                tooltip: AppStrings.share,
                icon: Icon(CupertinoIcons.share_up),
              );
            }
            return Padding(
              padding: AppStyles.paddingHorizontalMini,
              child: CircularProgressIndicator.adaptive(),
            );
          },
        );
      },
    );
  }

  Future<String> _hadithForShare({
    required String hadithNumber,
    required String hadithArabic,
    required String hadithTranslation,
  }) async {
    final arabic = html_parser.parse(hadithArabic);
    final translation = html_parser.parse(hadithTranslation);
    return [
      hadithNumber,
      arabic.body!.text,
      translation.body!.text,
    ].join('\n\n');
  }
}
