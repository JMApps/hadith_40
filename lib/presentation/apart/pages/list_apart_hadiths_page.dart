import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../lists/apart_hadiths_list.dart';
import '../../state/scroll_page_state.dart';
import '../../widgets/fab_to_start.dart';

class ListApartHadithsPage extends StatefulWidget {
  const ListApartHadithsPage({super.key});

  @override
  State<ListApartHadithsPage> createState() => _ListApartHadithsPageState();
}

class _ListApartHadithsPageState extends State<ListApartHadithsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ScrollPageState(_scrollController),
        ),
      ],
      child: Scaffold(
        body: ApartHadithsList(tableName: locale.tableName),
        floatingActionButton: FabTopStart(),
      ),
    );
  }
}
