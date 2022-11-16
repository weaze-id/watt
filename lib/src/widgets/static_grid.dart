import 'package:flutter/material.dart';

class StaticGrid extends StatelessWidget {
  const StaticGrid({
    Key? key,
    this.columnCount = 2,
    this.gap,
    this.padding,
    this.columnMainAxisAlignment = MainAxisAlignment.start,
    this.columnCrossAxisAlignment = CrossAxisAlignment.center,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.rowCrossAxisAlignment = CrossAxisAlignment.center,
    required this.children,
  }) : super(key: key);

  final int columnCount;
  final double? gap;
  final EdgeInsets? padding;
  final MainAxisAlignment columnMainAxisAlignment;
  final CrossAxisAlignment columnCrossAxisAlignment;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: columnCrossAxisAlignment,
        mainAxisAlignment: columnMainAxisAlignment,
        children: _createRows(),
      ),
    );
  }

  List<Widget> _createRows() {
    final List<Widget> rows = [];
    final childrenLength = children.length;
    final rowCount = (childrenLength / columnCount).ceil();

    for (int rowIndex = 0; rowIndex < rowCount; rowIndex++) {
      final List<Widget> columns = _createCells(rowIndex);
      rows.add(
        Row(
          crossAxisAlignment: rowCrossAxisAlignment,
          mainAxisAlignment: rowMainAxisAlignment,
          children: columns,
        ),
      );
      if (rowIndex != rowCount - 1) {
        rows.add(SizedBox(height: gap));
      }
    }

    return rows;
  }

  List<Widget> _createCells(int rowIndex) {
    final List<Widget> columns = [];
    final childrenLength = children.length;

    for (int columnIndex = 0; columnIndex < columnCount; columnIndex++) {
      final cellIndex = rowIndex * columnCount + columnIndex;
      if (cellIndex <= childrenLength - 1) {
        columns.add(Expanded(child: children[cellIndex]));
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
