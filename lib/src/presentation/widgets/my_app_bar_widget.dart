import 'package:aagel/src/presentation/widgets/custom_container_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/config/l10n/generated/l10n.dart';

class MyAppBarWidget extends StatelessWidget {
  const MyAppBarWidget({super.key});

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
          Text(S().app_bar_title),
        ],
      ),
    );
  }
}