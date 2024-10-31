import 'package:flutter/material.dart';
import 'package:hadith_40/presentation/state/apart_hadith_player_state.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/apart_hadith_entity.dart';
import '../../state/apart_hadiths_state.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/content_apart_hadith_item.dart';

class ContentApartHadithsList extends StatefulWidget {
  const ContentApartHadithsList({
    super.key,
    required this.tableName,
    required this.hadithId,
  });

  final String tableName;
  final int hadithId;

  @override
  State<ContentApartHadithsList> createState() => _ContentApartHadithsListState();
}

class _ContentApartHadithsListState extends State<ContentApartHadithsList> {
  late Future<List<ApartHadithEntity>> _futureApartHadiths;

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
        if (snapshot.hasData) {
          return ScrollablePositionedList.builder(
            itemScrollController: Provider.of<ApartHadithPlayerState>(context, listen: false).getItemScrollController,
            padding: AppStyles.withoutBottomMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final ApartHadithEntity apartHadithModel = snapshot.data![index];
              return ContentApartHadithItem(
                apartHadithModel: apartHadithModel,
                apartHadithIndex: index,
              );
            },
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
