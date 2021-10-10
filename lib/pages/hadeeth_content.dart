import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/data/database_query.dart';
import 'package:hadith_40/model/hadeeth_argument.dart';
import 'package:hadith_40/widgets/hadeeth_arabic_card.dart';
import 'package:hadith_40/widgets/hadeeth_content_title.dart';
import 'package:hadith_40/widgets/hadeeth_translation_card.dart';
import 'package:hadith_40/widgets/main_player.dart';

class HadeethContent extends StatefulWidget {
  const HadeethContent({Key? key}) : super(key: key);

  @override
  _HadeethContentState createState() => _HadeethContentState();
}

class _HadeethContentState extends State<HadeethContent> {
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HadeethArgument;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(
          '${args.hadeethNumber}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.square_stack_3d_up,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/hadeeth_apart_content',
                arguments: HadeethArgument(
                  args.id,
                  args.hadeethNumber,
                  args.hadeethTitle,
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.share,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          HadeethContentTitle(
            hadeethTitle: args.hadeethTitle!,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            borderRadius: 0,
          ),
          Expanded(
            child: FutureBuilder<List>(
              future: _databaseQuery.getOneHadeeth(args.id!),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.hasData
                    ? Scrollbar(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              HadeethArabic(
                                  hadeethArabic:
                                      snapshot.data![0].hadeethArabic),
                              const Divider(
                                  indent: 16,
                                  endIndent: 16,
                                  color: Colors.black54),
                              Container(
                                height: 50,
                                color: Colors.purple[300],
                                child: const MainPlayer(),
                              ),
                              const Divider(
                                  indent: 16,
                                  endIndent: 16,
                                  color: Colors.black54),
                              HadeethTranslation(
                                  hadeethTranslation:
                                      snapshot.data![0].hadeethTranslation),
                            ],
                          ),
                        ),
                      )
                    : const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
