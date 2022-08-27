import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/config/themes/theme_manager.dart';
import '../../../../../../core/utils/enums.dart';

class CategoryNewsWidget extends StatelessWidget {
  Function(NewsCategory)? onTab;
  final ValueNotifier<NewsCategory> categoryListen;

  CategoryNewsWidget({super.key, this.onTab, required this.categoryListen});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
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
                          color: categoryListen.value ==
                                  NewsCategory.values[index]
                              ? ThemeManager().appColor[3]
                              : null,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: ThemeManager().appColor[3],
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(toBeginningOfSentenceCase(
                              NewsCategory.values[index].category)!),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
