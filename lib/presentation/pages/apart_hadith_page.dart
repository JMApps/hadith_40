import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/data/datasources/databases/local/queries/local_apart_hadiths.dart';
import 'package:hadith_40/data/repositories/apart_hadiths_data_repository.dart';
import 'package:hadith_40/domain/entities/apart_hadith_entity.dart';
import 'package:hadith_40/domain/usecases/apart_hadiths_use_case.dart';
import 'package:hadith_40/presentation/items/apart_hadith_item.dart';
import 'package:hadith_40/presentation/widgets/data_is_empty_text.dart';
import 'package:hadith_40/presentation/widgets/error_text.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ApartHadithPage extends StatefulWidget {
  const ApartHadithPage({super.key, required this.hadithId, required this.hadithNumber});

  final int hadithId;
  final String hadithNumber;

  @override
  State<ApartHadithPage> createState() => _ApartHadithPageState();
}

class _ApartHadithPageState extends State<ApartHadithPage> {
  late final LocalApartHadiths _localApartHadiths;
  late final ApartHadithsDataRepository _apartHadithsDataRepository;
  late final ApartHadithsUseCase _apartHadithsUseCase;

  @override
  void initState() {
    _localApartHadiths = LocalApartHadiths();
    _apartHadithsDataRepository = ApartHadithsDataRepository(localApartHadiths: _localApartHadiths);
    _apartHadithsUseCase = ApartHadithsUseCase(apartHadithsRepository: _apartHadithsDataRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hadithNumber),
      ),
      body: FutureBuilder<List<ApartHadithEntity>>(
        future: _apartHadithsUseCase.getApartHadithsById(
          tableName: locale.apartTableName,
          hadithId: widget.hadithId, // from arguments
        ),
        builder: (BuildContext context, AsyncSnapshot<List<ApartHadithEntity>> snapshot) {
          if (snapshot.hasData) {
            return ScrollablePositionedList.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final ApartHadithEntity model = snapshot.data![index];
                return ApartHadithItem(
                  model: model,
                  index: index,
                );
              },
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: appColors.inversePrimary,
        child: const Icon(CupertinoIcons.play),
      ),
    );
  }
}