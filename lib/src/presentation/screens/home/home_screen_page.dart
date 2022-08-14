import 'package:aagel/src/core/config/themes/dark_theme.dart';
import 'package:aagel/src/core/config/themes/light_theme.dart';
import 'package:aagel/src/core/services/setting_service.dart';
import 'package:aagel/src/core/services/storage_service.dart';
import 'package:flutter/material.dart';


class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FloatingActionButton(onPressed: () async{
        await StorageService().saveBool('mode', false);
        SettingService().changeThemeMode(LightTheme());
      }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        await StorageService().saveBool('mode', true);
        SettingService().changeThemeMode(DarkTheme());
      }),
    );
  }
}