import 'package:flutter/material.dart';

import '../../theme/palette.dart';
import 'select_item.dart';

class SelectList<T> extends StatelessWidget {
  const SelectList({
    Key? key,
    this.contentPadding,
    required this.selected,
    required this.selections,
    required this.onSelectionChanged,
    this.multiSelectionEnabled = false,
  }) : super(key: key);

  final EdgeInsetsGeometry? contentPadding;
  final List<SelectItem<T>> selections;
  final Set<T> selected;
  final void Function(Set<T> values) onSelectionChanged;
  final bool multiSelectionEnabled;

  _onSelect(T value) {
    final newValues = {...selected};
    if (multiSelectionEnabled) {
      final isAny = newValues.any((e) => e == value);
      if (isAny && newValues.length != 1) {
        newValues.removeWhere((e) => e == value);
      } else {
        newValues.add(value);
      }

      onSelectionChanged(newValues);
      return;
    }

    newValues.clear();
    newValues.add(value);

    onSelectionChanged(newValues);
  }

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    return Column(
      children: selections
          .map(
            (e) => ListTile(
              contentPadding: contentPadding,
              leading: e.leading,
              title: Text(
                e.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              subtitle: e.subtitle != null
                  ? Text(
                      e.subtitle!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )
                  : null,
              trailing: selected.any((el) => el == e.value)
                  ? Icon(Icons.check, color: palette.primary)
                  : null,
              onTap: () => _onSelect(e.value),
            ),
          )
          .toList(),
    );
  }
}
