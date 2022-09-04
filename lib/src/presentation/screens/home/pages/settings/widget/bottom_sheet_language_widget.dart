import 'package:flutter/material.dart';

import '../../../../../../core/config/themes/theme_manager.dart';
import '../../../../../../core/utils/enums.dart';

class BottomSheetLanguageWidget extends StatelessWidget {
  BottomSheetLanguageWidget({super.key});

  SupportLanguage? supportLang;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ThemeManager().appColor[0],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          children: [
            RadioListTile(
              value: SupportLanguage.english,
              groupValue: supportLang,
              onChanged: (SupportLanguage? value) {
                supportLang = value;
              },
              title: Text(SupportLanguage.english.currentLang),
            ),
            RadioListTile(
              value: SupportLanguage.arabic,
              groupValue: supportLang,
              onChanged: (SupportLanguage? value) {
                supportLang = value;
              },
              title: Text(SupportLanguage.arabic.currentLang),
            ),
          ],
        ),
      ),
    );
  }
}
