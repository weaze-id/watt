import 'package:flutter/material.dart';

class SelectItem<T> {
  final String title;
  final String? subtitle;
  final T value;
  final Widget? leading;

  SelectItem({
    required this.title,
    this.subtitle,
    required this.value,
    this.leading,
  });

  SelectItem copyWith({
    String? title,
    String? subtitle,
    T? value,
    Widget? leading,
  }) {
    return SelectItem(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      value: value ?? this.value,
      leading: leading ?? this.leading,
    );
  }
}
