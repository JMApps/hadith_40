import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../lists/apart_hadiths_list.dart';
import '../../state/scroll_page_state.dart';
import '../../widgets/fab_to_start.dart';

class ApartHadithsPage extends StatefulWidget {
  const ApartHadithsPage({super.key});

  @override
  State<ApartHadithsPage> createState() => _ApartHadithsPageState();
}

class _ApartHadithsPageState extends State<ApartHadithsPage> {
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
