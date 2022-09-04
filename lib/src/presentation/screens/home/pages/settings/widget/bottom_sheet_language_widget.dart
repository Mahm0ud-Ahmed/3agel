import 'package:flutter/material.dart';

import '../../../../../../core/utils/enums.dart';

class BottomSheetLanguageWidget extends StatelessWidget {
  BottomSheetLanguageWidget({super.key});

  SupportLanguage? supportLang;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
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
    );
  }
}