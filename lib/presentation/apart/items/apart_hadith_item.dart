import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/styles/app_styles.dart';
import '../../../core/routes/route_page_names.dart';
import '../../../data/models/arguments/apart_hadith_args.dart';
import '../../../domain/entities/hadith_entity.dart';
import '../../state/hadiths_state.dart';

class ApartHadithItem extends StatelessWidget {
  const ApartHadithItem({
    super.key,
    required this.hadithModel,
    required this.hadithIndex,
  });

  final HadithEntity hadithModel;
  final int hadithIndex;

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final itemOddColor = appColors.inversePrimary.withOpacity(0.075);
    final itemEvenColor = appColors.inversePrimary.withOpacity(0.150);
    return Padding(
      padding: AppStyles.paddingBottomMini,
      child: ListTile(
        contentPadding: AppStyles.apartListTile,
        splashColor: appColors.inversePrimary.withOpacity(0.5),
        tileColor: hadithIndex.isOdd ? itemOddColor : itemEvenColor,
        shape: AppStyles.shape,
        onTap: () async {
          HapticFeedback.lightImpact();
          Provider.of<HadithsState>(context, listen: false).saveLastHadithId(hadithModel.id);
          await Navigator.pushNamed(
            context,
            RoutePageNames.contentApartHadith,
            arguments: ApartHadithArgs(
              tableName: locale.tableName,
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
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: appColors.secondary,
        ),
      ),
    );
  }
}
