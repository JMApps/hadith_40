import 'package:flutter/material.dart';
import 'package:hadith_40/core/styles/app_style.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: AppStyle.mainMarding,
      alignment: Alignment.center,
      child: SelectableText(
        errorMessage,
        style: textTheme.displayMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
