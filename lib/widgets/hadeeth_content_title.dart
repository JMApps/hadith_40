import 'package:flutter/material.dart';

class HadeethContentTitle extends StatelessWidget {
  const HadeethContentTitle({
    Key? key,
    required this.hadeethTitle,
    required this.backgroundColor,
    required this.textColor,
    required this.borderRadius,
  }) : super(key: key);

  final String hadeethTitle;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(borderRadius),
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Text(
            hadeethTitle,
            style: TextStyle(
              fontSize: 18,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
