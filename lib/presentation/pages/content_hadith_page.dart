import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/core/routes/route_page_names.dart';
import 'package:hadith_40/data/datasources/databases/local/queries/local_content_hadith.dart';
import 'package:hadith_40/data/models/arguments/apart_hadith_args.dart';
import 'package:hadith_40/data/repositories/content_hadith_data_repository.dart';
import 'package:hadith_40/domain/entities/content_hadith_entity.dart';
import 'package:hadith_40/domain/usecases/content_hadith_use_case.dart';
import 'package:hadith_40/presentation/items/content_hadith_item.dart';
import 'package:hadith_40/presentation/uistate/content_hadith_ui_state.dart';
import 'package:hadith_40/presentation/uistate/content_player_state.dart';
import 'package:hadith_40/presentation/widgets/content_media_buttons.dart';
import 'package:hadith_40/presentation/widgets/error_text.dart';
import 'package:provider/provider.dart';

class ContentHadithPage extends StatefulWidget {
  const ContentHadithPage({super.key, required this.hadithId});

  final int hadithId;

  @override
  State<ContentHadithPage> createState() => _ContentHadithPageState();
}

class _ContentHadithPageState extends State<ContentHadithPage> {
  late final LocalContentHadith _localContentHadith;
  late final ContentHadithDataRepository _contentHadithDataRepository;
  late final ContentHadithUseCase _contentHadithUseCase;
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.hadithId - 1);
    _localContentHadith = LocalContentHadith();
    _contentHadithDataRepository = ContentHadithDataRepository(localContentHadith: _localContentHadith);
    _contentHadithUseCase = ContentHadithUseCase(contentHadithRepository: _contentHadithDataRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContentHadithUiState(widget.hadithId - 1),
        ),
        ChangeNotifierProvider(
          create: (_) => ContentPlayerState(),
        ),
      ],
      child: Consumer<ContentHadithUiState>(
        builder: (context, uiState, _) {
          return FutureBuilder<List<ContentHadithEntity>>(
            future: _contentHadithUseCase.getContentHadith(
              tableName: locale.tableName,
              hadithId: widget.hadithId,
            ),
            builder: (BuildContext context, AsyncSnapshot<List<ContentHadithEntity>> snapshot) {
              if (snapshot.hasData) {
                final ContentHadithEntity model = snapshot.data![uiState.getContentPageIndex];
                return Scaffold(
                  appBar: AppBar(
                    title: Text(model.hadithNumber),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RoutePageNames.apartContentHadithName,
                            arguments: ApartHadithArgs(
                              hadithId: widget.hadithId,
                              hadithNumber: model.hadithNumber,
                            ),
                          );
                        },
                        tooltip: locale.apart,
                        icon: const Icon(CupertinoIcons.layers_alt),
                      ),
                    ],
                  ),
                  body: SelectableRegion(
                    focusNode: FocusNode(),
                    selectionControls: Platform.isIOS
                        ? CupertinoTextSelectionControls()
                        : MaterialTextSelectionControls(),
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final ContentHadithEntity model = snapshot.data![index];
                        return ContentHadithItem(model: model, index: index);
                      },
                      onPageChanged: (int? pageIndex) {
                        uiState.setContentPageIndex = pageIndex!;
                      },
                    ),
                  ),
                  bottomNavigationBar: ContentMediaButtons(
                    pageController: _pageController,
                  ),
                );
              } else if (snapshot.hasError) {
                return ErrorText(
                  errorMessage: snapshot.error.toString(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
