import 'dart:async';

import 'package:flutter/material.dart';

class GridBuilderUtil {
  static Widget createRow({
    double? gap,
    bool expanded = false,
    required int rowIndex,
    required int itemCount,
    required int rowCount,
    required int columnCount,
    required MainAxisAlignment rowMainAxisAlignment,
    required CrossAxisAlignment rowCrossAxisAlignment,
    required Widget Function(BuildContext ontext, int index) builder,
    FutureOr<void> Function()? onLoadData,
  }) {
    if (onLoadData != null && rowIndex == rowCount - 1) {
      onLoadData();
      return const ListTile(title: Center(child: CircularProgressIndicator()));
    }

    final children = <Widget>[];
    children.add(
      Row(
        crossAxisAlignment: rowCrossAxisAlignment,
        mainAxisAlignment: rowMainAxisAlignment,
        children: _createCells(
          gap: gap,
          rowIndex: rowIndex,
          itemCount: itemCount,
          columnCount: columnCount,
          builder: builder,
        ),
      ),
    );

    if (rowIndex != rowCount - 1) {
      children.add(SizedBox(height: gap));
    }

    final column = Column(children: children);
    return expanded ? Expanded(child: column) : column;
  }

  static List<Widget> _createCells({
    double? gap,
    required int rowIndex,
    required int itemCount,
    required int columnCount,
    required Widget Function(BuildContext ontext, int index) builder,
  }) {
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
