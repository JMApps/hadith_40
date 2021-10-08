import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/data/database_query.dart';
import 'package:hadith_40/model/hadeeth_argument.dart';
import 'package:hadith_40/widgets/hadeeth_arapt_list_item.dart';
import 'package:hadith_40/widgets/hadeeth_content_title.dart';

class HadeethApartContent extends StatefulWidget {
  const HadeethApartContent({Key? key}) : super(key: key);

  @override
  _HadeethApartContentState createState() => _HadeethApartContentState();
}

class _HadeethApartContentState extends State<HadeethApartContent> {
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HadeethArgument;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(
          '${args.hadeethNumber}',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          HadeethContentTitle(
            hadeethTitle: args.hadeethTitle!,
            backgroundColor: Colors.deepPurple,
            textColor: Colors.white,
            borderRadius: 50,
          ),
          Expanded(
              child: FutureBuilder<List>(
            future: _databaseQuery.getApartHadeeth(args.id!),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasError
                  ? Center(
                      child: Text('${snapshot.error}'),
                    )
                  : snapshot.hasData
                      ? Scrollbar(
                          child: ListView.separated(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return HadeethApartListItem(
                                  item: snapshot.data[index]);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider();
                            },
                          ),
                        )
                      : const Center(
                          child: CupertinoActivityIndicator(),
                        );
            },
          )),
        ],
      ),
    );
  }
}
