import 'package:flutter/material.dart';

import '../../theme/watt_theme.dart';
import 'input_base.dart';

class OutlinedInput extends StatelessWidget {
  const OutlinedInput({
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
    this.cursorColor,
    this.iconColor,
    this.labelColor,
    this.hintColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
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
  final Color? cursorColor;
  final Color? iconColor;
  final Color? labelColor;
  final Color? hintColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool autofocus;
  final bool autocorrect;

  @override
  Widget build(BuildContext context) {
    final wattTheme = WattTheme.of(context);
    return InputBase(
      controller: controller,
      cursorColor: cursorColor,
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
      filled: false,
      iconColor: iconColor,
      labelColor: labelColor,
      hintColor: hintColor,
      contentPadding: contentPadding,
      autofocus: autofocus,
      autocorrect: autocorrect,
      enabledBorderColor: enabledBorderColor,
      focusedBorderColor: focusedBorderColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(wattTheme!.inputBorderRadius),
      ),
    );
  }
}
