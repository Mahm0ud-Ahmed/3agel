import 'package:aagel/src/presentation/widgets/custom_container_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/config/l10n/generated/l10n.dart';
import '../../core/services/setting_service.dart';
import '../../core/services/storage_service.dart';
import '../../core/utils/constant.dart';

class MyAppBarWidget extends StatefulWidget {
  const MyAppBarWidget({super.key});

  @override
  State<MyAppBarWidget> createState() => _MyAppBarWidgetState();
}

class _MyAppBarWidgetState extends State<MyAppBarWidget> {
  late String title;
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    title = S().app_bar_title;
    _locale = SettingService.getLocale;
  }

  @override
  void didUpdateWidget(covariant MyAppBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    String? storageLang = StorageService().getString(Constant.kLocaleLanguageCode);
    if(storageLang != _locale.languageCode) {
      Future.delayed(const Duration(microseconds: 0), () {
        setState(() {
          title = S().app_bar_title;
          _locale = SettingService.getLocale;
        });
      },);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Row(
        children: [
          const CustomContainerWithIcon(
            child: FaIcon(
              FontAwesomeIcons.globe,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12,),
          Text(title),
        ],
      ),
    );
  }
}