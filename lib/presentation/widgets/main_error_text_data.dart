import 'package:flutter/material.dart';

import '../../core/styles/app_styles.dart';

class MainErrorTextData extends StatelessWidget {
  const MainErrorTextData({
    super.key,
    required this.errorText,
  });

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.padding,
      alignment: Alignment.center,
      child: SelectableText(
        errorText,
        style: TextStyle(
          fontSize: 18.0,
          color: Theme.of(context).colorScheme.error,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
