import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../domain/entities/hadith_entity.dart';
import '../../state/hadiths_state.dart';
import '../../state/play_list_state.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/play_list_item.dart';

class PlayListList extends StatefulWidget {
  const PlayListList({
    super.key,
    required this.tableName,
  });

  final String tableName;

  @override
  State<PlayListList> createState() => _PlayListListState();
}

class _PlayListListState extends State<PlayListList> {
  late final Future<List<HadithEntity>> _futureHadiths;

  @override
  void initState() {
    super.initState();
    _futureHadiths = Provider.of<HadithsState>(context, listen: false).fetchAllHadiths(tableName: widget.tableName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HadithEntity>>(
      future: _futureHadiths,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MainErrorTextData(errorText: snapshot.error.toString());
        }
        if (snapshot.hasData) {
          return ScrollablePositionedList.builder(
            physics: const ClampingScrollPhysics(),
            itemScrollController: Provider.of<PlayListState>(context, listen: false).itemScrollController,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final HadithEntity hadithModel = snapshot.data![index];
              return PlayListItem(
                hadithModel: hadithModel,
                index: index,
              );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
