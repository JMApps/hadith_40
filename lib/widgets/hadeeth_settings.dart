import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadith_40/provider/hadeeth_settings_state.dart';
import 'package:provider/provider.dart';

class HadeethSettings extends StatelessWidget {
  const HadeethSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        height: 200,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(25),
            left: Radius.circular(25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Размер текста',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                Expanded(
                  child: CupertinoSlider(
                    activeColor: Colors.blue,
                    min: 14,
                    max: 40,
                    value:
                        context.read<HadeethSettingsState>().getTextSizeCount,
                    onChanged: (value) {
                      context
                          .read<HadeethSettingsState>()
                          .changeTextSizeCount(value);
                    },
                  ),
                ),
                Text(
                  context
                      .watch<HadeethSettingsState>()
                      .getTextSizeCount
                      .toInt()
                      .toString(),
                  style: const TextStyle(fontSize: 18, color: Colors.blue),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Text(
                  'Цвет арабского текста',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: const [
                Text(
                  'Цвет текста перевода',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
