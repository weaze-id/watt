import 'package:flutter/material.dart';

import '../../theme/watt_theme.dart';
import 'input_base.dart';

class UnderlinedInput extends StatelessWidget {
  const UnderlinedInput({
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
    this.filled,
    this.cursorColor,
    this.valueColor,
    this.iconColor,
    this.labelColor,
    this.hintColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
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
  final bool? filled;
  final Color? cursorColor;
  final Color? valueColor;
  final Color? iconColor;
  final Color? labelColor;
  final Color? hintColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? fillColor;
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
      filled: filled,
      iconColor: iconColor,
      valueColor: valueColor,
      labelColor: labelColor,
      hintColor: hintColor,
      fillColor: fillColor,
      contentPadding: contentPadding,
      autofocus: autofocus,
      autocorrect: autocorrect,
      focusedBorderColor: focusedBorderColor,
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(wattTheme!.inputBorderRadius),
        ),
      ),
    );
  }
}
