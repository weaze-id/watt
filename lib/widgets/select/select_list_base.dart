import 'package:flutter/material.dart';

import '../../palette/palette.dart';
import 'select_item.dart';

class SelectListBase extends StatelessWidget {
  const SelectListBase({
    Key? key,
    required this.contentPadding,
    required this.values,
    required this.items,
    required this.onChanged,
    required this.multipleSelect,
  }) : super(key: key);

  final EdgeInsetsGeometry? contentPadding;
  final List<int> values;
  final List<SelectItem> items;
  final void Function(List<int> values) onChanged;
  final bool multipleSelect;

  _onSelect(int index) {
    final newValues = [...values];
    if (multipleSelect) {
      final isAny = newValues.any((e) => e == index);
      if (isAny) {
        newValues.removeWhere((e) => e == index);
      } else {
        newValues.add(index);
      }
      onChanged(newValues);
      return;
    }

    newValues.clear();
    newValues.add(index);

    onChanged(newValues);
  }

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final children = <Widget>[];

    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      children.add(
        ListTile(
          contentPadding: contentPadding,
          title: Text(
            item.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: item.subtitle != null
              ? Text(
                  item.subtitle!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              : null,
          trailing: values.any((e) => e == i)
              ? Icon(Icons.check, color: palette.primary)
              : null,
          onTap: () => _onSelect(i),
        ),
      );
    }

    return Column(children: children);
  }
}
