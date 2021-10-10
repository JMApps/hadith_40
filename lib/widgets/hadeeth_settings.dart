import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/provider/hadeeth_settings_state.dart';
import 'package:o_color_picker/o_color_picker.dart';
import 'package:provider/provider.dart';

class HadeethSettings extends StatelessWidget {
  const HadeethSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(25),
                left: Radius.circular(25),
              ),
            ),
            child: Material(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Размер текста',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoSlider(
                          activeColor: Colors.blue,
                          min: 14,
                          max: 40,
                          value: context
                              .read<HadeethSettingsState>()
                              .getTextSizeCount,
                          onChanged: (value) {
                            context
                                .read<HadeethSettingsState>()
                                .changeTextSizeCount(value);
                          },
                          onChangeEnd: (value) {
                            context
                                .read<HadeethSettingsState>()
                                .saveTextSizeCount(value);
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        context.watch<HadeethSettingsState>().getTextSizeCount.toInt().toString(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    title: const Text(
                      'Цвет арабского текста',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: context
                            .watch<HadeethSettingsState>()
                            .getArabicColor,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OColorPicker(
                                    selectedColor: context.read<HadeethSettingsState>().getArabicColor,
                                    colors: primaryColorsPalette,
                                    onColorChange: (color) {
                                      context.read<HadeethSettingsState>().changeArabicTextColor(color);
                                      context.read<HadeethSettingsState>().saveArabicTextColor(color);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Цвет текста перевода',
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: context.watch<HadeethSettingsState>().getTranslationColor,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OColorPicker(
                                    selectedColor: context.read<HadeethSettingsState>().getTranslationColor,
                                    colors: primaryColorsPalette,
                                    onColorChange: (color) {
                                      context.read<HadeethSettingsState>().changeTranslationTextColor(color);
                                      context.read<HadeethSettingsState>().saveTranslationTextColor(color);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
