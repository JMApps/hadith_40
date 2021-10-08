import 'package:flutter/material.dart';
import 'package:hadith_40/model/hadeeth_argument.dart';
import 'package:hadith_40/widgets/hadeeth_content_title.dart';

class HadeethApartContent extends StatelessWidget {
  const HadeethApartContent({Key? key}) : super(key: key);

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
        ],
      ),
    );
  }
}
