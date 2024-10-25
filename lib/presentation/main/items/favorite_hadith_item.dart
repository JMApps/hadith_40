import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/route_page_names.dart';
import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/models/arguments/hadith_args.dart';
import '../../../domain/entities/hadith_entity.dart';
import '../../state/hadiths_state.dart';

class FavoriteHadithItem extends StatelessWidget {
  const FavoriteHadithItem({
    super.key,
    required this.hadithModel,
    required this.hadithIndex,
  });

  final HadithEntity hadithModel;
  final int hadithIndex;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final itemOddColor = appColors.inversePrimary.withOpacity(0.150);
    final itemEvenColor = appColors.inversePrimary.withOpacity(0.075);
    return Padding(
      padding: AppStyles.paddingBottomMini,
      child: ListTile(
        onTap: () async {
          HapticFeedback.lightImpact();
          Provider.of<HadithsState>(context, listen: false).saveLastHadithId(hadithModel.id);
          await Navigator.pushNamed(
            context,
            RoutePageNames.contentHadithPage,
            arguments: HadithArgs(
              hadithId: hadithModel.id,
            ),
          );
        },
        horizontalTitleGap: 8,
        contentPadding: AppStyles.paddingMini,
        splashColor: appColors.inversePrimary.withOpacity(0.5),
        tileColor: hadithIndex.isOdd ? itemOddColor : itemEvenColor,
        shape: AppStyles.shape,
        title: Text(
          hadithModel.hadithNumber,
          style: TextStyle(
            color: appColors.primary,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          hadithModel.hadithTitle,
          style: TextStyle(
            color: appColors.onSurface,
            fontSize: 17.0,
          ),
        ),
        leading: IconButton.filledTonal(
          onPressed: () {
            Provider.of<HadithsState>(context, listen: false).toggleFavorite(hadithId: hadithModel.id);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: appColors.secondaryContainer,
                duration: const Duration(milliseconds: 500),
                shape: AppStyles.shapeTop,
                elevation: 0,
                content: Text(
                  AppStrings.removed,
                  style: TextStyle(
                    fontSize: 17.0,
                    color: appColors.onSurface,
                  ),
                ),
              ),
            );
          },
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.bookmark,
            color: appColors.secondary,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: appColors.secondary,
        ),
      ),
    );
  }
}
