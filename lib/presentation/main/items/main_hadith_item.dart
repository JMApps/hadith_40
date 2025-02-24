import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/routes/route_page_names.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/models/arguments/hadith_args.dart';
import '../../../domain/entities/hadith_entity.dart';
import '../../state/hadiths_state.dart';

class MainHadithItem extends StatelessWidget {
  const MainHadithItem({
    super.key,
    required this.hadithModel,
    required this.hadithIndex,
  });

  final HadithEntity hadithModel;
  final int hadithIndex;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final itemOddColor = appColors.inversePrimary.withOpacity(0.075);
    final itemEvenColor = appColors.inversePrimary.withOpacity(0.150);
    return Container(
      margin: AppStyles.paddingBottomMini,
      decoration: BoxDecoration(
        borderRadius: AppStyles.border,
        color: hadithIndex.isOdd ? itemOddColor : itemEvenColor,
      ),
      child: ListTile(
        horizontalTitleGap: 8,
        contentPadding: AppStyles.paddingMini,
        splashColor: appColors.inversePrimary.withOpacity(0.5),
        shape: AppStyles.shape,
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
        leading: Consumer<HadithsState>(
          builder: (context, hadithsState, _) {
            return IconButton.filledTonal(
              onPressed: () {
                hadithsState.toggleFavorite(hadithId: hadithModel.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: appColors.secondaryContainer,
                    duration: const Duration(milliseconds: 500),
                    shape: AppStyles.shapeTop,
                    elevation: 0,
                    content: Text(
                      hadithsState.isFavorite(hadithId: hadithModel.id) ? locale.added : locale.removed,
                      style: TextStyle(
                        color: appColors.onSurface,
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                );
              },
              padding: EdgeInsets.zero,
              icon: Icon(
                hadithsState.isFavorite(hadithId: hadithModel.id) ? Icons.bookmark : Icons.bookmark_outline_outlined,
                color: appColors.secondary,
              ),
            );
          },
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: appColors.secondary,
        ),
      ),
    );
  }
}
