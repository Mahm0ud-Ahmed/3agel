import 'package:aagel/src/core/services/setting_service.dart';
import 'package:aagel/src/presentation/controllers/setting_helper.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/config/themes/theme_manager.dart';
import '../../../../../../core/utils/enums.dart';

class BottomSheetLanguageWidget extends StatelessWidget {
  ValueNotifier<SupportLanguage?> languageNotifier =
      ValueNotifier<SupportLanguage?>(null);

  BottomSheetLanguageWidget({super.key}){
    initialLanguageNotifier();
  }

  initialLanguageNotifier() {
    if (SettingService.getLocale.languageCode == 'en') {
      languageNotifier.value = SupportLanguage.english;
    }else{
      languageNotifier.value = SupportLanguage.arabic;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ValueListenableBuilder(
        valueListenable: languageNotifier,
        builder: (context, value, child) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: ThemeManager().appColor[0],
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RadioListTile(
                  value: SupportLanguage.english,
                  groupValue: languageNotifier.value,
                  onChanged: (SupportLanguage? value) {
                    languageNotifier.value = value;
                    SettingHelper.changeLanguage(value);
                  },
                  title: Text(SupportLanguage.english.currentLang),
                ),
                RadioListTile(
                  value: SupportLanguage.arabic,
                  groupValue: languageNotifier.value,
                  onChanged: (SupportLanguage? value) {
                    languageNotifier.value = value;
                    SettingHelper.changeLanguage(value);
                  },
                  title: Text(SupportLanguage.arabic.currentLang),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
