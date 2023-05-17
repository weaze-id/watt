import 'package:flutter/material.dart';

import '../../../watt.dart';

class InputBase extends StatefulWidget {
  const InputBase({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.initialValue,
    required this.passwordField,
    required this.prefixIcon,
    required this.maxLength,
    required this.maxLines,
    required this.keyboardType,
    required this.validator,
    required this.onSaved,
    required this.onChanged,
    required this.onFieldSubmitted,
    this.autofocus = false,
    this.autocorrect = false,
    required this.filled,
    this.cursorColor,
    this.iconColor,
    this.labelColor,
    this.hintColor,
    this.fillColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.border,
    required this.contentPadding,
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
  final bool autofocus;
  final bool autocorrect;
  final bool? filled;
  final Color? cursorColor;
  final Color? iconColor;
  final Color? labelColor;
  final Color? hintColor;
  final Color? fillColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<InputBase> createState() => _InputBaseState();
}

class _InputBaseState extends State<InputBase> {
  bool _isPasswordShow = false;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);

    final iconButton = IconButton(
      onPressed: () => setState(() => _isPasswordShow = !_isPasswordShow),
      icon: Icon(_isPasswordShow ? Icons.visibility_off : Icons.visibility),
    );

    return TextFormField(
      cursorColor: widget.cursorColor,
      controller: widget.controller,
      initialValue: widget.initialValue,
      validator: widget.validator,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: widget.keyboardType,
      obscureText: widget.passwordField && !_isPasswordShow,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      autofocus: widget.autofocus,
      autocorrect: widget.autocorrect,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: widget.labelColor),
        hintStyle: TextStyle(color: widget.hintColor),
        contentPadding: widget.contentPadding,
        labelText: widget.label,
        hintText: widget.hint,
        filled: widget.filled,
        fillColor: widget.fillColor,
        border: widget.border,
        enabledBorder: widget.border?.copyWith(
          borderSide: widget.border?.borderSide.copyWith(
            color: widget.enabledBorderColor ?? palette.gray,
          ),
        ),
        focusedBorder: widget.border?.copyWith(
          borderSide: widget.border?.borderSide.copyWith(
            color: widget.focusedBorderColor ?? palette.primary,
            width: 2,
          ),
        ),
        iconColor: widget.iconColor,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.passwordField ? iconButton : null,
      ),
    );
  }
}
