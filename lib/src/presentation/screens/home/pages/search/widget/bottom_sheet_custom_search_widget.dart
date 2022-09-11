import 'package:flutter/material.dart';

import '../../../../../../core/config/themes/theme_manager.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../controllers/setting_helper.dart';

class BottomSheetCustomSearchWidget extends StatelessWidget {
  final ValueNotifier<NewsCategory?> _categoryNotifier =
      ValueNotifier<NewsCategory?>(null);

  BottomSheetCustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ThemeManager().appColor[0],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<NewsCategory>.unmodifiable(NewsCategory.values)
                .map(
                  (NewsCategory item) => ValueListenableBuilder<NewsCategory?>(
                    valueListenable: _categoryNotifier,
                    builder: (context, category, child) {
                      return RadioListTile<NewsCategory>(
                        value: item,
                        groupValue: category,
                        onChanged: (NewsCategory? value) {
                          _categoryNotifier.value = value;
                          Navigator.pop(context);
                        },
                        title: Text(SettingHelper.setSectionName(item)),
                      );
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
