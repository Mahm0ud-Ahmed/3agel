import 'package:flutter/material.dart';

import '../../../../../../core/config/l10n/generated/l10n.dart';
import '../../../../../../core/config/themes/theme_manager.dart';
import '../../../../../../core/utils/enums.dart';

class CategoryNewsWidget extends StatelessWidget {
  Function(NewsCategory)? onTab;
  final ValueNotifier<NewsCategory> categoryListen;

  CategoryNewsWidget({super.key, this.onTab, required this.categoryListen});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(NewsCategory.values.length, (index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(end: 6),
            child: GestureDetector(
              onTap: () => onTab!.call(NewsCategory.values[index]),
              child: SizedBox(
                height: 40,
                width: 108,
                child: ValueListenableBuilder(
                  valueListenable: categoryListen,
                  builder: (context, value, child) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color:
                            categoryListen.value == NewsCategory.values[index]
                                ? ThemeManager().appColor[3]
                                : null,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: ThemeManager().appColor[3],
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(setSectionName(NewsCategory.values[index])),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  String setSectionName(NewsCategory category) {
    late String value;
    switch (category) {
      case NewsCategory.business:
        value = S().api_section_business;
        break;
      case NewsCategory.entertainment:
        value = S().api_section_entertainment;
        break;
      case NewsCategory.general:
        value = S().api_section_general;
        break;
      case NewsCategory.health:
        value = S().api_section_health;
        break;
      case NewsCategory.science:
        value = S().api_section_science;
        break;
      case NewsCategory.sports:
        value = S().api_section_sports;
        break;
      case NewsCategory.technology:
        value = S().api_section_technology;
        break;
    }
    return value;
  }
}
