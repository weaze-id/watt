import 'package:flutter/material.dart';
import 'package:witt/witt.dart';

import '../../theme/theme_generator_settings.dart';
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

  @override
  Widget build(BuildContext context) {
    final themeGeneratorSettings = WService.get<ThemeGeneratorSettings>();
    return InputBase(
      controller: controller,
      label: label,
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
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(themeGeneratorSettings.inputBorderRadius),
        ),
      ),
    );
  }
}
