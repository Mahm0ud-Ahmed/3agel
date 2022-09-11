import 'package:flutter/material.dart';

import '../../core/config/themes/theme_manager.dart';

class GenericTextField extends StatefulWidget {
  Function(String)? onChange;
  Function()? onTab;
  final EdgeInsetsGeometry margin;
  final String? initialValue;

  GenericTextField({
    super.key,
    required this.margin,
    this.onChange,
    this.onTab,
    this.initialValue,
  });

  @override
  State<GenericTextField> createState() => _GenericTextFieldState();
}

class _GenericTextFieldState extends State<GenericTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: ThemeManager().appColor[2],
            contentPadding: const EdgeInsetsDirectional.only(
              top: 6,
              start: 14,
            ),
            suffixIcon: GestureDetector(
              onTap: widget.onTab,
              child: Icon(
                Icons.search,
                color: ThemeManager().appColor[3],
              ),
            ),
          ),
          onChanged: widget.onChange,
        ),
      ),
    );
  }
}
