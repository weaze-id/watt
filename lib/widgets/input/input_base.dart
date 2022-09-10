import 'package:flutter/material.dart';

class InputBase extends StatefulWidget {
  const InputBase({
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
    this.fillColor,
    this.border,
    this.contentPadding,
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
