import 'package:flutter/material.dart';

class HadeethContentTitle extends StatelessWidget {
  const HadeethContentTitle({Key? key, required this.hadeethTitle}) : super(key: key);

  final String hadeethTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Text(
            hadeethTitle,
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue[100],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
