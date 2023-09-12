import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/core/styles/app_styles.dart';
import 'package:hadith_40/domain/entities/apart_hadith_entity.dart';
import 'package:hadith_40/presentation/items/apart_back_card_item.dart';
import 'package:hadith_40/presentation/items/apart_front_card_item.dart';

class ApartHadithCardItem extends StatelessWidget {
  const ApartHadithCardItem({
    super.key,
    required this.model,
    required this.index,
  });

  final ApartHadithEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color oddItemColor = appColors.primary.withOpacity(0.15);
    final Color evenItemColor = appColors.primary.withOpacity(0.05);
    return Container(
      padding: AppStyles.mainMardingMini,
      color: index.isOdd ? oddItemColor : evenItemColor,
      child: FlipCard(
        front: ApartFrontCardItem(
          arabicText: model.hadithArabic,
        ),
        back: ApartFrontBackItem(
          translationText: model.hadithTranslation,
        ),
      ),
    );
  }
}
