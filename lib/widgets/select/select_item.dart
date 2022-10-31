import 'package:flutter/material.dart';

class SelectItem {
  final String title;
  final String? subtitle;
  final Widget? leading;

  SelectItem({
    required this.title,
    this.subtitle,
    this.leading,
  });

  SelectItem copyWith({
    String? title,
    String? subtitle,
    Widget? leading,
  }) {
    return SelectItem(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      leading: leading ?? this.leading,
    );
  }
}
