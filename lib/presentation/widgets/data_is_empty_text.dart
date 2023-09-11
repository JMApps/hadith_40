import 'package:flutter/material.dart';
import 'package:hadith_40/core/styles/app_style.dart';

class DataIsEmptyText extends StatelessWidget {
  const DataIsEmptyText({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: AppStyle.mainMarding,
      alignment: Alignment.center,
      child: SelectableText(
        message,
        style: textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
