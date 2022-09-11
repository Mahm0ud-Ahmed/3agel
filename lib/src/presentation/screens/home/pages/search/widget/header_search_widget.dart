import 'package:flutter/material.dart';

import '../../../../../../core/config/themes/theme_manager.dart';
import '../../../../../widgets/custom_container_with_icon.dart';
import '../../../../../widgets/generic_text_field.dart';
import 'bottom_sheet_custom_search_widget.dart';

class HeaderSearchWidget extends StatelessWidget {
  Function(String)? onChange;
  Function()? onTab;

  HeaderSearchWidget({
    super.key,
    this.onChange,
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: Row(
        children: [
          Expanded(
            child: GenericTextField(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              onChange: onChange,
              onTab: onTab,
            ),
          ),
          CustomContainerWithIcon(
            margin: const EdgeInsetsDirectional.only(end: 12),
            backgroundColor: ThemeManager().appColor[2],
            height: double.infinity,
            width: 38,
            onClick: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                builder: (context) => BottomSheetCustomSearchWidget(),
              );
            },
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
