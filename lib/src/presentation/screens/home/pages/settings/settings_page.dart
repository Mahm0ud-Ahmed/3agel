import 'package:aagel/src/presentation/screens/home/pages/settings/widget/bottom_sheet_language_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/config/l10n/generated/l10n.dart';
import '../../../../widgets/custom_container_with_icon.dart';
import 'widget/bottom_sheet_theme_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Row(
            children: [
              const CustomContainerWithIcon(
                child: FaIcon(
                  FontAwesomeIcons.globe,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(S().app_bar_title),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                builder: (context) {
                  return BottomSheetLanguageWidget();
                },
              );
            },
            title: Text(S().setting_page_language),
            trailing: const FaIcon(
              FontAwesomeIcons.language,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                builder: (context) {
                  return BottomSheetThemeWidget();
                },
              );
            },
            title: Text(S().setting_page_theme),
            trailing: const Icon(
              Icons.dark_mode,
            ),
          ),
        ),
      ],
    );
  }
}
