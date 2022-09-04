import 'package:flutter/material.dart';

import '../config/themes/icon_broken.dart';

enum NavBarSection {
  home({0: IconBroken.Home}),
  search({1: IconBroken.Search}),
  bookmark({2: IconBroken.Bookmark}),
  news({3: IconBroken.Paper}),
  setting({4: IconBroken.Setting});

  final Map<int, IconData> navData;

  const NavBarSection(this.navData);
}

enum NewsCategory {
  business('business'),
  entertainment('entertainment'),
  general('general'),
  health('health'),
  science('science'),
  sports('sports'),
  technology('technology');

  final String category;

  const NewsCategory(this.category);
}

enum SupportLanguage {
  english('English'),
  arabic('عربي');

  final String currentLang;

  const SupportLanguage(this.currentLang);
}

enum SupportTheme {
  dark('Dark Mod'),
  light('Light Mod');

  final String themeMod;

  const SupportTheme(this.themeMod);
}
