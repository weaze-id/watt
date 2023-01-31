import 'package:flutter/material.dart';

class GridBuilder extends StatelessWidget {
  const GridBuilder({
    Key? key,
    this.columnCount = 2,
    this.gap,
    this.padding,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.rowCrossAxisAlignment = CrossAxisAlignment.center,
    required this.builder,
    required this.itemCount,
  }) : super(key: key);

  final int columnCount;
  final double? gap;
  final EdgeInsets? padding;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final Widget Function(BuildContext ontext, int index) builder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final rowCount = (itemCount / columnCount).ceil();
    return ListView.builder(
      padding: padding,
      itemBuilder: (context, index) => _createRow(rowCount, index),
      itemCount: rowCount,
    );
  }

  Widget _createRow(int rowCount, int index) {
    final children = <Widget>[];
    children.add(
      Row(
        crossAxisAlignment: rowCrossAxisAlignment,
        mainAxisAlignment: rowMainAxisAlignment,
        children: _createCells(index),
      ),
    );

    if (index != rowCount - 1) {
      children.add(SizedBox(height: gap));
    }

    return Column(children: children);
  }

  List<Widget> _createCells(int rowIndex) {
    final List<Widget> columns = [];
    final childrenLength = itemCount;

    for (int columnIndex = 0; columnIndex < columnCount; columnIndex++) {
      final cellIndex = rowIndex * columnCount + columnIndex;
      if (cellIndex <= childrenLength - 1) {
        columns.add(
          Expanded(
            child: Builder(builder: (context) => builder(context, cellIndex)),
          ),
        );
      } else {
        columns.add(Expanded(child: Container()));
      }

      if (columnIndex != columnCount - 1) {
        columns.add(SizedBox(width: gap));
      }
    }

    return columns;
  }
}
