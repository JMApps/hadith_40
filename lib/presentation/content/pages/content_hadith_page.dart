import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/route_page_names.dart';
import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/hadith_entity.dart';
import '../../state/content_settings_state.dart';
import '../../state/hadiths_state.dart';
import '../../state/scroll_page_state.dart';
import '../../widgets/fab_to_start.dart';
import '../../widgets/main_error_text_data.dart';
import '../../widgets/main_html_data.dart';

class ContentHadithPage extends StatefulWidget {
  const ContentHadithPage({
    super.key,
    required this.tableName,
    required this.hadithId,
  });

  final String tableName;
  final int hadithId;

  @override
  State<ContentHadithPage> createState() => _ContentHadithPageState();
}

class _ContentHadithPageState extends State<ContentHadithPage> {
  final ScrollController _scrollController = ScrollController();
  late final Future<HadithEntity> _futureHadiths;

  @override
  void initState() {
    super.initState();
    _futureHadiths = Provider.of<HadithsState>(context, listen: false).fetchHadithById(tableName: widget.tableName, hadithId: widget.hadithId);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.colorScheme;
    final bool isLight = theme.brightness == Brightness.light;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ScrollPageState(_scrollController),
        ),
      ],
      child: FutureBuilder<HadithEntity>(
        future: _futureHadiths,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final HadithEntity hadithModel = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                title: Text(hadithModel.hadithNumber),
                actions: [
                  IconButton(
                    onPressed: () async {
                      Navigator.pushNamed(
                        context,
                        RoutePageNames.contentSettingsPage,
                      );
                    },
                    icon: Icon(Icons.settings),
                  ),
                ],
              ),
              body: Scrollbar(
                controller: _scrollController,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  padding: AppStyles.paddingMini,
                  child: Consumer<ContentSettingsState>(
                    builder: (context, contentSettings, _) {
                      return Card(
                        elevation: 0,
                        margin: EdgeInsets.zero,
                        color: appColors.onSecondary.withOpacity(0.5),
                        child: Padding(
                          padding: AppStyles.paddingMini,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MainHtmlData(
                                htmlData: hadithModel.hadithArabic,
                                footnoteColor: appColors.primary,
                                font: AppStrings.arabicFonts[contentSettings.getArabicFontIndex],
                                fontSize: AppStyles.textSizes[contentSettings.getArabicFontSizeIndex] + 5,
                                textAlign: AppStyles.textAligns[contentSettings.getArabicFontAlignIndex],
                                fontColor: isLight ? Color(contentSettings.getArabicLightTextColor) : Color(contentSettings.getArabicDarkTextColor),
                                textDirection: TextDirection.rtl,
                                textHeight: 1.75,
                              ),
                              const Divider(indent: 16, endIndent: 16),
                              MainHtmlData(
                                htmlData: hadithModel.hadithTranslation,
                                footnoteColor: appColors.primary,
                                font: AppStrings.translationFonts[contentSettings.getTranslationFontIndex],
                                fontSize: AppStyles.textSizes[contentSettings.getTranslationFontSizeIndex],
                                textAlign: AppStyles.textAligns[contentSettings.getTranslationFontAlignIndex],
                                fontColor: isLight ? Color(contentSettings.getTranslationLightTextColor) : Color(contentSettings.getTranslationDarkTextColor),
                                textDirection: TextDirection.ltr,
                                textHeight: 1.35,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              floatingActionButton: FabTopStart(),
            );
          }
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(),
              body: MainErrorTextData(errorText: snapshot.error.toString()),
            );
          }
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        },
      ),
    );
  }
}
