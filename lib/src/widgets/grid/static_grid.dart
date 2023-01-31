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
    this.expanded = false,
    required this.children,
  }) : super(key: key);

  final int columnCount;
  final double? gap;
  final EdgeInsets? padding;
  final MainAxisAlignment columnMainAxisAlignment;
  final CrossAxisAlignment columnCrossAxisAlignment;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final bool expanded;
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
    final rowCount = (children.length / columnCount).ceil();

    for (int rowIndex = 0; rowIndex < rowCount; rowIndex++) {
      final row = Row(
        crossAxisAlignment: rowCrossAxisAlignment,
        mainAxisAlignment: rowMainAxisAlignment,
        children: _createCells(rowIndex),
      );

      rows.add(expanded ? Expanded(child: row) : row);

      if (rowIndex != rowCount - 1) {
        rows.add(SizedBox(height: gap));
      }
    }

    return rows;
  }

  List<Widget> _createCells(int rowIndex) {
    final List<Widget> columns = [];
    for (int columnIndex = 0; columnIndex < columnCount; columnIndex++) {
      final cellIndex = rowIndex * columnCount + columnIndex;
      if (cellIndex <= children.length - 1) {
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
