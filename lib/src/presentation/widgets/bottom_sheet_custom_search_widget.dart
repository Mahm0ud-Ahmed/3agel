import 'package:flutter/material.dart';

import '../../core/config/themes/theme_manager.dart';
import '../../core/utils/enums.dart';
import '../controllers/setting_helper.dart';

class BottomSheetCustomSearchWidget extends StatelessWidget {
  final ValueNotifier<NewsCategory?>? categoryNotifier;
  final Function(NewsCategory?)? onChoose;

  const BottomSheetCustomSearchWidget({
    super.key,
    this.onChoose,
    this.categoryNotifier,
  });

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
                  (NewsCategory item) => RadioListTile<NewsCategory>(
                    value: item,
                    groupValue: categoryNotifier?.value,
                    onChanged: (NewsCategory? value) {
                      categoryNotifier?.value = value;
                      onChoose?.call(value);
                      Navigator.pop(context);
                    },
                    title: Text(SettingHelper.setSectionName(item)),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
