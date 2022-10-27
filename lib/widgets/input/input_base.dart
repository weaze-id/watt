import 'package:flutter/material.dart';

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
    required this.fillColor,
    required this.border,
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
  final Color? fillColor;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<InputBase> createState() => _InputBaseState();
}

class _InputBaseState extends State<InputBase> {
  bool _isPasswordShow = false;

  @override
  Widget build(BuildContext context) {
    final iconButton = IconButton(
      onPressed: () => setState(() => _isPasswordShow = !_isPasswordShow),
      icon: Icon(_isPasswordShow ? Icons.visibility_off : Icons.visibility),
    );

    return TextFormField(
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
        contentPadding: widget.contentPadding,
        labelText: widget.label,
        hintText: widget.hint,
        filled: widget.filled,
        fillColor: widget.fillColor,
        border: widget.border,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.passwordField ? iconButton : null,
      ),
    );
  }
}
