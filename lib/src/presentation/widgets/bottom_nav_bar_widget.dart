import 'package:aagel/src/presentation/widgets/bottom_nav_bar_item_widget.dart';
import 'package:flutter/material.dart';

import '../../core/config/themes/theme_manager.dart';
import '../../core/utils/enums.dart';

class BottomNavBarWidget extends StatelessWidget {

  const BottomNavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ThemeManager().themes.appColor[0],
          border: Border.all(
            color: ThemeManager().themes.appColor[5],
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(NavBarSection.values.length, (index){
            return BottomNavBarItemWidget(
              section: NavBarSection.values[index], 
              index: index,
            );
          }),
        ),
      ),
    );
  }
}