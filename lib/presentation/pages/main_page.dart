import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/data/datasources/local/databases/database_helper.dart';
import 'package:hadith_40/data/repositories/hadith_data_repository.dart';
import 'package:hadith_40/domain/entities/hadith_entity.dart';
import 'package:hadith_40/domain/usecases/all_hadith_use_case.dart';
import 'package:hadith_40/presentation/widgets/error_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final DatabaseHelper _databaseHelper;
  late final HadithDataRepository _hadithDataRepository;
  late final AllHadithUseCase _allHadithUseCase;

  @override
  void initState() {
    _databaseHelper = DatabaseHelper();
    _hadithDataRepository = HadithDataRepository(databaseHelper: _databaseHelper);
    _allHadithUseCase = AllHadithUseCase(hadithRepository: _hadithDataRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.appName,
        ),
      ),
      body: FutureBuilder<List<HadithEntity>>(
        future: _allHadithUseCase.getAllHadiths(tableName: locale.tableName),
        builder:
            (BuildContext context, AsyncSnapshot<List<HadithEntity>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final HadithEntity hadithEntity = snapshot.data![index];
                return Text(hadithEntity.hadithTitle);
              },
            );
          } else if (snapshot.hasError) {
            return ErrorText(errorMessage: snapshot.error.toString());
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.rectangle_grid_1x2),
            label: locale.hadiths,
            tooltip: locale.hadiths,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.bookmark),
            label: locale.bookmarks,
            tooltip: locale.bookmarks,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.layers_alt),
            label: locale.apart,
            tooltip: locale.apart,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.settings),
            label: locale.settings,
            tooltip: locale.settings,
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info),
            label: 'О нас',
            tooltip: 'О нас',
          ),
        ],
      ),
    );
  }
}
