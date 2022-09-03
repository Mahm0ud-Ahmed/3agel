import 'package:flutter/material.dart';

import '../../../../../../core/config/themes/theme_manager.dart';
import '../../../../../widgets/custom_container_with_icon.dart';
import '../../../../../widgets/generic_text_field.dart';

class HeaderSearchWidget extends StatelessWidget {
  const HeaderSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: Row(
        children: [
          Expanded(
            child: GenericTextField(
              margin: const EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
          CustomContainerWithIcon(
            margin: const EdgeInsetsDirectional.only(end: 12),
            backgroundColor: ThemeManager().appColor[2],
            height: double.infinity,
            width: 38,
            child: Icon(
              Icons.filter_list,
              color: ThemeManager().appColor[3],
              // size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
