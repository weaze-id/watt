import 'package:flutter/material.dart';

import '../../theme/theme_generator.dart';
import 'input_base.dart';

class FilledInput extends StatelessWidget {
  const FilledInput({
    Key? key,
    this.controller,
    this.label,
    this.hint,
    this.initialValue,
    this.passwordField = false,
    this.prefixIcon,
    this.maxLength,
    this.maxLines = 1,
    this.keyboardType,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.fillColor,
    this.contentPadding,
    this.autofocus = false,
    this.autocorrect = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? initialValue;
  final bool passwordField;
  final Widget? prefixIcon;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function(String?)? onFieldSubmitted;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool autofocus;
  final bool autocorrect;

  @override
  Widget build(BuildContext context) {
    final themeGeneratorSettings = ThemeGenerator.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(label!),
          const SizedBox(height: 4),
        ],
        InputBase(
          controller: controller,
          label: null,
          hint: hint,
          initialValue: initialValue,
          passwordField: passwordField,
          prefixIcon: prefixIcon,
          maxLength: maxLength,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          onSaved: onSaved,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          filled: true,
          fillColor: fillColor,
          contentPadding: contentPadding,
          autofocus: autofocus,
          autocorrect: autocorrect,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              themeGeneratorSettings!.inputBorderRadius,
            ),
          ),
        ),
      ],
    );
  }
}
