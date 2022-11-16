import 'package:flutter/material.dart';

import 'select_item.dart';
import 'select_list_base.dart';

class MultiSelectList extends StatelessWidget {
  const MultiSelectList({
    Key? key,
    this.contentPadding,
    required this.values,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final EdgeInsetsGeometry? contentPadding;
  final List<int> values;
  final List<SelectItem> items;
  final void Function(List<int> value) onChanged;

  @override
  Widget build(BuildContext context) {
    return SelectListBase(
      contentPadding: contentPadding,
      values: values,
      items: items,
      onChanged: onChanged,
      multipleSelect: true,
    );
  }
}
