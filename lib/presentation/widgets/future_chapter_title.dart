import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/styles/app_styles.dart';
import '../../domain/entities/hadith_entity.dart';
import '../state/hadiths_state.dart';
import 'main_error_text_data.dart';

class FutureChapterTitle extends StatefulWidget {
  const FutureChapterTitle({
    super.key,
    required this.tableName,
    required this.hadithId,
  });

  final String tableName;
  final int hadithId;

  @override
  State<FutureChapterTitle> createState() => _FutureChapterTitleState();
}

class _FutureChapterTitleState extends State<FutureChapterTitle> {
  late Future<HadithEntity> _futureHadith;

  @override
  void initState() {
    super.initState();
    _futureHadith = Provider.of<HadithsState>(context, listen: false).fetchHadithById(
      tableName: widget.tableName,
      hadithId: widget.hadithId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HadithEntity>(
      future: _futureHadith,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final HadithEntity hadithModel = snapshot.data!;
          return Container(
            margin: AppStyles.withoutBottomMini,
            padding: AppStyles.paddingMini,
            decoration: BoxDecoration(
              borderRadius: AppStyles.borderMini,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            child: Text(
              hadithModel.hadithTitle,
              style: AppStyles.mainTextStyle18Bold,
              textAlign: TextAlign.center,
            ),
          );
        }
        if (snapshot.hasError) {
          return MainErrorTextData(
            errorText: snapshot.error.toString(),
          );
        }
        return Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
