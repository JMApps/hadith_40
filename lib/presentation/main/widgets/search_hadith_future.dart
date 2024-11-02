import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/hadith_entity.dart';
import '../../state/hadiths_state.dart';
import '../../widgets/main_description.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/main_hadith_item.dart';

class SearchHadithFuture extends StatefulWidget {
  const SearchHadithFuture({
    super.key,
    required this.tableName,
    required this.query,
  });

  final String tableName;
  final String query;

  @override
  State<SearchHadithFuture> createState() => _SearchHadithFutureState();
}

class _SearchHadithFutureState extends State<SearchHadithFuture> {
  late Future<List<HadithEntity>> _futureMainHadiths;
  List<HadithEntity> _hadiths = [];
  List<HadithEntity> _recentHadiths = [];

  @override
  void initState() {
    _futureMainHadiths = Provider.of<HadithsState>(context, listen: false).fetchAllHadiths(tableName: widget.tableName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<List<HadithEntity>>(
      future: _futureMainHadiths,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _hadiths = snapshot.data!;
          _recentHadiths = widget.query.isEmpty ? _hadiths : _hadiths.where((element) =>
          element.id.toString().contains(widget.query) || element.hadithNumber.toLowerCase().contains(widget.query) || element.hadithTitle.toLowerCase().contains(widget.query)).toList();
          return _recentHadiths.isEmpty ? MainDescriptionText(descriptionText: locale.searchIsEmpty) : Scrollbar(
            child: ListView.builder(
              padding: AppStyles.paddingMini,
              itemCount: _recentHadiths.length,
              itemBuilder: (BuildContext context, int index) {
                return MainHadithItem(
                  hadithModel: _recentHadiths[index],
                  hadithIndex: index,
                );
              },
            ),
          );
        }
        if (snapshot.hasData && snapshot.data!.isEmpty) {
          return MainDescriptionText(
            descriptionText: locale.searchIsEmpty,
          );
        }
        if (snapshot.hasError) {
          return MainErrorTextData(errorText: snapshot.error.toString());
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
