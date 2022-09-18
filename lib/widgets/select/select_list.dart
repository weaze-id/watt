import 'package:flutter/material.dart';

import 'select_item.dart';
import 'select_list_base.dart';

class SelectList extends StatelessWidget {
  const SelectList({
    Key? key,
    this.contentPadding,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final EdgeInsetsGeometry? contentPadding;
  final int value;
  final List<SelectItem> items;
  final void Function(int value) onChanged;

  @override
  Widget build(BuildContext context) {
    return SelectListBase(
      contentPadding: contentPadding,
      values: [value],
      items: items,
      onChanged: (values) => onChanged.call(values.first),
      multipleSelect: false,
    );
  }
}
