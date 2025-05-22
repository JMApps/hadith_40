import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/apart_hadith_entity.dart';
import '../../state/apart_hadiths_state.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/card_main_hadith_item.dart';

class CardHadithList extends StatefulWidget {
  const CardHadithList({
    super.key,
    required this.tableName,
    required this.hadithId,
  });

  final String tableName;
  final int hadithId;

  @override
  State<CardHadithList> createState() => _CardHadithListState();
}

class _CardHadithListState extends State<CardHadithList> {
  late final Future<List<ApartHadithEntity>> _futureApartHadiths;

  @override
  void initState() {
    super.initState();
    _futureApartHadiths = Provider.of<ApartHadithsState>(context, listen: false).fetchApartHadithById(tableName: widget.tableName, hadithId: widget.hadithId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ApartHadithEntity>>(
      future: _futureApartHadiths,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MainErrorTextData(errorText: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: AppStyles.withoutBottomMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final ApartHadithEntity apartHadithModel = snapshot.data![index];
              return CardMainHadith(
                apartHadithModel: apartHadithModel,
                apartHadithIndex: index,
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
