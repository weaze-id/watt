import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../watt.dart';
import 'input_base.dart';

class FilledInput extends StatelessWidget {
  const FilledInput({
    Key? key,
    this.controller,
    this.readOnly = false,
    this.showCursor,
    this.inputFormatters,
    this.enabled,
    this.label,
    this.hint,
    this.initialValue,
    this.passwordField = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.maxLines = 1,
    this.keyboardType,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.cursorColor,
    this.valueColor,
    this.iconColor,
    this.labelColor,
    this.hintColor,
    this.fillColor,
    this.contentPadding,
    this.autofocus = false,
    this.autocorrect = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool readOnly;
  final bool? showCursor;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final String? label;
  final String? hint;
  final String? initialValue;
  final bool passwordField;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function(String?)? onFieldSubmitted;
  final Color? cursorColor;
  final Color? valueColor;
  final Color? iconColor;
  final Color? labelColor;
  final Color? hintColor;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool autofocus;
  final bool autocorrect;

  @override
  Widget build(BuildContext context) {
    final wattTheme = WattTheme.of(context);
    final palette = Palette.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(label!, style: TextStyle(color: labelColor)),
          const SizedBox(height: 4),
        ],
        InputBase(
          controller: controller,
          readOnly: readOnly,
          showCursor: showCursor,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorColor: cursorColor,
          label: null,
          hint: hint,
          initialValue: initialValue,
          passwordField: passwordField,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          maxLength: maxLength,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          onSaved: onSaved,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          filled: true,
          valueColor: valueColor,
          iconColor: iconColor,
          hintColor: hintColor,
          fillColor: fillColor ?? palette.gray.withOpacity(.15),
          contentPadding: contentPadding,
          autofocus: autofocus,
          autocorrect: autocorrect,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(wattTheme.inputBorderRadius),
          ),
        ),
      ],
    );
  }
}
