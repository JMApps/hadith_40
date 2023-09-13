import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/core/styles/app_styles.dart';
import 'package:hadith_40/domain/entities/apart_hadith_entity.dart';
import 'package:hadith_40/presentation/items/apart_back_card_item.dart';
import 'package:hadith_40/presentation/items/apart_front_card_item.dart';
import 'package:hadith_40/presentation/uistate/apart_card_state.dart';
import 'package:provider/provider.dart';

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
      child: Consumer<ApartCardState>(
        builder: (BuildContext context, cardState, Widget? child) {
          return FlipCard(
            front: cardState.getCardFlip
                ? ApartFrontCardItem(
                    arabicText: model.hadithArabic,
                  )
                : ApartFrontBackItem(
                    translationText: model.hadithTranslation,
                  ),
            back: cardState.getCardFlip
                ? ApartFrontBackItem(
                    translationText: model.hadithTranslation,
                  )
                : ApartFrontCardItem(
                    arabicText: model.hadithArabic,
                  ),
          );
        },
      ),
    );
  }
}
