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
    _databaseHelper  = DatabaseHelper();
    _hadithDataRepository = HadithDataRepository(databaseHelper: _databaseHelper);
    _allHadithUseCase = AllHadithUseCase(hadithRepository: _hadithDataRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.appName,
        ),
      ),
      body: FutureBuilder<List<HadithEntity>>(
        future: _allHadithUseCase.getAllHadiths(),
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
    );
  }
}
