import 'package:flutter/material.dart';

import '../../core/config/themes/theme_manager.dart';

class GenericTextField extends StatelessWidget {
  Function(String)? onChange;
  Function()? onTab;
  final EdgeInsetsGeometry margin;

  GenericTextField({
    super.key,
    required this.margin,
    this.onChange,
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: ThemeManager().appColor[2],
            contentPadding: const EdgeInsetsDirectional.only(
              top: 6,
              start: 14,
            ),
            suffixIcon: GestureDetector(
              onTap: onTab,
              child: Icon(
                Icons.search,
                color: ThemeManager().appColor[3],
              ),
            ),
          ),
          onChanged: onChange,
        ),
      ),
    );
  }
}
