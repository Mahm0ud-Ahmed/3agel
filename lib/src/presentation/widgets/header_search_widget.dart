import 'package:aagel/src/core/utils/enums.dart';
import 'package:flutter/material.dart';

import '../../core/config/themes/theme_manager.dart';
import 'bottom_sheet_custom_search_widget.dart';
import 'custom_container_with_icon.dart';
import 'generic_text_field.dart';

class HeaderSearchWidget extends StatelessWidget {
  Function(String)? onChange;
  Function()? onTab;
  final Function(NewsCategory?)? onChoose;
  final ValueNotifier<NewsCategory?>? categoryNotifier;

  HeaderSearchWidget({
    super.key,
    this.onChange,
    this.onTab,
    this.onChoose,
    this.categoryNotifier,
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
          ValueListenableBuilder(
            valueListenable: categoryNotifier!,
            builder: (context, value, child) {
              return CustomContainerWithIcon(
                margin: const EdgeInsetsDirectional.only(end: 12),
                backgroundColor: ThemeManager().appColor[2],
                height: double.infinity,
                width: 38,
                onClick: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25)),
                    ),
                    builder: (context) => BottomSheetCustomSearchWidget(
                      onChoose: onChoose,
                      categoryNotifier: categoryNotifier,
                    ),
                  );
                },
                child: Icon(
                  Icons.filter_list,
                  color: ThemeManager().appColor[3],
                  // size: 18,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
