import 'package:aagel/src/core/config/themes/light_theme.dart';
import 'package:aagel/src/core/config/themes/theme_manager.dart';
import 'package:aagel/src/core/services/setting_service.dart';
import 'package:aagel/src/core/services/storage_service.dart';
import 'package:aagel/src/presentation/controllers/setting_helper.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/config/themes/dark_theme.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/utils/enums.dart';

class BottomSheetThemeWidget extends StatelessWidget {
  ValueNotifier<SupportTheme?> themeNotifier =
      ValueNotifier<SupportTheme?>(null);

  BottomSheetThemeWidget({super.key}) {
    initialThemeNotifier();
  }

  initialThemeNotifier() {
    switch (SettingService.stateMod) {
      case ThemeMode.light:
        themeNotifier.value = SupportTheme.light;
        break;
      case ThemeMode.dark:
        themeNotifier.value = SupportTheme.dark;
        break;
      default:
        themeNotifier.value = SupportTheme.light;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ValueListenableBuilder(
        valueListenable: themeNotifier,
        builder: (context, value, child) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: ThemeManager().appColor[0],
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: Column(
              children: [
                RadioListTile(
                  value: SupportTheme.light,
                  groupValue: themeNotifier.value,
                  onChanged: (SupportTheme? value) async {
                    themeNotifier.value = value;
                    await SettingHelper.changeThemeMode(value);
                  },
                  title: Text(SupportTheme.light.themeMod),
                ),
                RadioListTile(
                  value: SupportTheme.dark,
                  groupValue: themeNotifier.value,
                  onChanged: (SupportTheme? value) async {
                    themeNotifier.value = value;
                    await SettingHelper.changeThemeMode(value);
                  },
                  title: Text(SupportTheme.dark.themeMod),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
