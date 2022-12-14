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
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: ThemeManager().appColor[0],
            border: Border.all(
              color: ThemeManager().appColor[5],
              width: 0.5,
            ),
            boxShadow: [
              BoxShadow(
                color: ThemeManager().appColor[2],
                blurRadius: 40.0,
                spreadRadius: 4.0,
              )
            ],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(NavBarSection.values.length, (index) {
              return BottomNavBarItemWidget(
                section: NavBarSection.values[index],
                index: index,
              );
            }),
          ),
        ),
      ),
    );
  }
}
