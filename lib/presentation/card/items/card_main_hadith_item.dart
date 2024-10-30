import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/apart_hadith_entity.dart';
import '../../state/card_mode_state.dart';
import 'card_back_hadith_item.dart';
import 'card_front_hadith_item.dart';

class CardMainHadith extends StatelessWidget {
  const CardMainHadith({
    super.key,
    required this.apartHadithModel,
    required this.apartHadithIndex,
  });

  final ApartHadithEntity apartHadithModel;
  final int apartHadithIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<CardModeState>(
      builder: (context, cardMode, _) {
        return FlipCard(
          direction: FlipDirection.VERTICAL,
          front: cardMode.getReverseCard
              ? CardFrontHadithItem(
                  hadithTranslation: apartHadithModel.hadithArabic,
                  apartHadithIndex: apartHadithIndex,
                )
              : CardBackHadithItem(
                  hadithArabic: apartHadithModel.hadithTranslation,
                  apartHadithIndex: apartHadithIndex,
                ),
          back: cardMode.getReverseCard
              ? CardBackHadithItem(
                  hadithArabic: apartHadithModel.hadithTranslation,
                  apartHadithIndex: apartHadithIndex,
                )
              : CardFrontHadithItem(
                  hadithTranslation: apartHadithModel.hadithArabic,
                  apartHadithIndex: apartHadithIndex,
                ),
        );
      },
    );
  }
}
