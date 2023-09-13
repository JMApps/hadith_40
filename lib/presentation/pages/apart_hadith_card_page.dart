import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/data/datasources/databases/local/queries/local_apart_hadiths.dart';
import 'package:hadith_40/data/repositories/apart_hadiths_data_repository.dart';
import 'package:hadith_40/domain/entities/apart_hadith_entity.dart';
import 'package:hadith_40/domain/usecases/apart_hadiths_use_case.dart';
import 'package:hadith_40/presentation/items/apart_hadith_card_item.dart';
import 'package:hadith_40/presentation/uistate/apart_card_state.dart';
import 'package:hadith_40/presentation/widgets/data_is_empty_text.dart';
import 'package:hadith_40/presentation/widgets/error_text.dart';
import 'package:provider/provider.dart';

class ApartHadithCardPage extends StatefulWidget {
  const ApartHadithCardPage({super.key, required this.hadithId});

  final int hadithId;

  @override
  State<ApartHadithCardPage> createState() => _ApartHadithCardPageState();
}

class _ApartHadithCardPageState extends State<ApartHadithCardPage> {
  late final LocalApartHadiths _localApartHadiths;
  late final ApartHadithsDataRepository _apartHadithsDataRepository;
  late final ApartHadithsUseCase _apartHadithsUseCase;

  @override
  void initState() {
    _localApartHadiths = LocalApartHadiths();
    _apartHadithsDataRepository =
        ApartHadithsDataRepository(localApartHadiths: _localApartHadiths);
    _apartHadithsUseCase = ApartHadithsUseCase(
        apartHadithsRepository: _apartHadithsDataRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ApartCardState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(locale.cardMode),
          actions: [
            Consumer<ApartCardState>(
              builder: (BuildContext context, cardState, Widget? child) {
                return IconButton(
                  onPressed: () {
                    cardState.setCardFlip();
                  },
                  icon: const Icon(
                    CupertinoIcons.arrow_2_circlepath,
                  ),
                );
              },
            ),
          ],
        ),
        body: FutureBuilder<List<ApartHadithEntity>>(
          future: _apartHadithsUseCase.getApartHadithsById(
            tableName: locale.apartTableName,
            hadithId: widget.hadithId, // from arguments
          ),
          builder: (BuildContext context,
              AsyncSnapshot<List<ApartHadithEntity>> snapshot) {
            if (snapshot.hasData) {
              return CupertinoScrollbar(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ApartHadithEntity model = snapshot.data![index];
                    return ApartHadithCardItem(
                      model: model,
                      index: index,
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return ErrorText(
                errorMessage: snapshot.error.toString(),
              );
            } else {
              return DataIsEmptyText(message: locale.isEmptyBookmarks);
            }
          },
        ),
      ),
    );
  }
}
