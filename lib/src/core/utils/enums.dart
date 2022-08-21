import 'package:flutter/material.dart';

import '../config/themes/icon_broken.dart';

enum NavBarSection{
  home({0: IconBroken.Home}),
  search({1: IconBroken.Search}),
  bookmark({2: IconBroken.Bookmark}),
  news({3: IconBroken.Paper}),
  profile({4: IconBroken.Profile});

  final Map<int, IconData> navData;

  const NavBarSection(this.navData);
}