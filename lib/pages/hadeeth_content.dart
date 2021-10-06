import 'package:flutter/material.dart';
import 'package:hadith_40/model/hadeeth_argument.dart';

class HadeethContent extends StatefulWidget {
  const HadeethContent({Key? key}) : super(key: key);

  @override
  _HadeethContentState createState() => _HadeethContentState();
}

class _HadeethContentState extends State<HadeethContent> {

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HadeethArgument;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        elevation: 1,
        title: Text(
          '${args.hadeethNumber}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[700],
      ),
    );
  }
}