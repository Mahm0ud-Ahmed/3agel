import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/config/themes/theme_manager.dart';
import '../../core/utils/enums.dart';
import '../controllers/navigation_bar_controller.dart';
import 'custom_container_with_icon.dart';

class BottomNavBarItemWidget extends StatefulWidget {

  final NavBarSection section;
  final int index;


  const BottomNavBarItemWidget({
    super.key,
    required this.section,
    required this.index,
  });

  @override
  State<BottomNavBarItemWidget> createState() => _BottomNavBarItemWidgetState();
}

class _BottomNavBarItemWidgetState extends State<BottomNavBarItemWidget> {
  NavigationBarController? cubit;

  @override
  void initState() {
    super.initState();
    cubit = NavigationBarController.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> cubit?.setIndex(widget.index),
      child: BlocBuilder<NavigationBarController, int>(
        builder: (context, state) {
          return CustomContainerWithIcon(
            width: 48,
            height: 40,
            backgroundColor: state == widget.section.navData.keys.first ? ThemeManager().themes.appColor[3] : ThemeManager().themes.appColor[2],
            child: Icon(
              widget.section.navData.values.first,
              size: 20,
              color: state == widget.section.navData.keys.first ? ThemeManager().themes.appColor[0] : ThemeManager().themes.appColor[3],
            )
          );
        },
      ),
    );
  }
}