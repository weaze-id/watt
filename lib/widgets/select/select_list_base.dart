import 'package:flutter/material.dart';

import '../../palette/palette.dart';
import 'select_item.dart';

class SelectListBase extends StatefulWidget {
  const SelectListBase({
    Key? key,
    required this.contentPadding,
    required this.values,
    required this.items,
    required this.onChanged,
    required this.multipleSelect,
  }) : super(key: key);

  final EdgeInsetsGeometry? contentPadding;
  final List<SelectItem> values;
  final List<SelectItem> items;
  final void Function(List<SelectItem> values) onChanged;
  final bool multipleSelect;

  @override
  State<SelectListBase> createState() => _SelectListBaseState();
}

class _SelectListBaseState extends State<SelectListBase> {
  final values = <SelectItem>[];

  void initState() {
    values.addAll(widget.values);
    super.initState();
  }

  _onSelect(SelectItem item) {
    final isAny = values.any((e) => e.value == item.value);
    if (widget.multipleSelect) {
      if (isAny) {
        setState(() => values.removeWhere((e) => e.value == item.value));
      } else {
        setState(() => values.add(item));
      }

      widget.onChanged(values);
      return;
    }

    setState(() => values.clear());
    setState(() => values.add(item));

    widget.onChanged(values);
  }

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final children = <Widget>[];

    for (final item in widget.items) {
      children.add(
        ListTile(
          contentPadding: widget.contentPadding,
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
          trailing: values.any((e) => e.value == item.value)
              ? Icon(Icons.check, color: palette.primary)
              : null,
          onTap: () => _onSelect(item),
        ),
      );
    }

    return Column(children: children);
  }
}
