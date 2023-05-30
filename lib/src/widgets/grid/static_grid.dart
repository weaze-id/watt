import 'dart:async';

import 'package:flutter/material.dart';

/// A grid layout widget that arranges its children in a static grid format.
///
/// The `StaticGrid` widget allows you to create a grid layout with a fixed number
/// of columns. It can be used with a fixed list of children or with a builder
/// function to generate the children dynamically.
///
/// If you provide a list of children, they will be arranged in rows and columns
/// based on the specified number of columns. If the `expanded` property is set
/// to `true`, the grid will expand to fill the available space vertically.
///
/// If you use the builder pattern (`StaticGrid.builder` or `StaticGrid.sliver`),
/// you can provide a builder function that generates the widgets dynamically
/// based on the index. This is useful when you have a large number of items
/// or when the items need to be fetched asynchronously. You can also specify
/// additional properties like gap, padding, and alignment.
///
/// Example usage:
///
/// ```dart
/// StaticGrid(
///   columnCount: 2,
///   gap: 10.0,
///   padding: EdgeInsets.all(16.0),
///   children: [
///     Container(color: Colors.red),
///     Container(color: Colors.blue),
///     Container(color: Colors.green),
///     Container(color: Colors.yellow),
///   ],
/// )
/// ```
// ignore: must_be_immutable
class StaticGrid extends StatefulWidget {
  /// Creates a `StaticGrid` widget.
  ///
  /// The `columnCount` parameter specifies the number of columns in the grid.
  /// The `gap` parameter defines the spacing between cells. The `padding`
  /// parameter defines the padding around the grid. The `columnMainAxisAlignment`
  /// and `columnCrossAxisAlignment` parameters control the alignment of columns.
  /// The `rowMainAxisAlignment` and `rowCrossAxisAlignment` parameters control
  /// the alignment of rows. The `expanded` parameter determines if the grid
  /// should expand to fill the available vertical space. The `children` parameter
  /// is a list of widgets to be arranged in the grid.
  StaticGrid({
    Key? key,
    this.columnCount = 2,
    this.gap,
    this.padding,
    MainAxisAlignment columnMainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment columnCrossAxisAlignment = CrossAxisAlignment.center,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.rowCrossAxisAlignment = CrossAxisAlignment.center,
    bool? expanded = false,
    required List<Widget>? children,
  })  : _columnMainAxisAlignment = columnMainAxisAlignment,
        _columnCrossAxisAlignment = columnCrossAxisAlignment,
        _children = children,
        _expanded = expanded,
        super(key: key);

  /// Creates a `StaticGrid` widget using the builder pattern.
  ///
  /// The `columnCount` parameter specifies the number of columns in the grid.
  /// The `gap` parameter defines the spacing between cells. The `padding`
  /// parameter defines the padding around the grid. The `rowMainAxisAlignment`
  /// and `rowCrossAxisAlignment` parameters control the alignment of rows.
  /// The `itemBuilder` parameter is a function that returns a widget based on
  /// the `BuildContext` and index. The `itemCount` parameter specifies the
  /// total number of items in the grid. The `onLoadData` parameter is an
  /// optional function that can be used to load additional data asynchronously.
  StaticGrid.builder({
    Key? key,
    this.columnCount = 2,
    this.gap,
    this.padding,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.rowCrossAxisAlignment = CrossAxisAlignment.center,
    required Widget Function(BuildContext, int)? itemBuilder,
    required int? itemCount,
    FutureOr<void> Function()? onLoadData,
  })  : _onLoadData = onLoadData,
        _itemCount = itemCount,
        _itemBuilder = itemBuilder,
        _isBuilder = true,
        super(key: key);

  /// Creates a `StaticGrid` widget as a sliver.
  ///
  /// The `columnCount` parameter specifies the number of columns in the grid.
  /// The `gap` parameter defines the spacing between cells. The `padding`
  /// parameter defines the padding around the grid. The `rowMainAxisAlignment`
  /// and `rowCrossAxisAlignment` parameters control the alignment of rows.
  /// The `itemBuilder` parameter is a function that returns a widget based on
  /// the `BuildContext` and index. The `itemCount` parameter specifies the
  /// total number of items in the grid. The `findChildIndexCallback` parameter
  /// is a function that can be used to find the index of a child widget based
  /// on its `Key`. The `addAutomaticKeepAlives` and `addRepaintBoundaries`
  /// parameters control the behavior of sliver children. The `onLoadData`
  /// parameter is an optional function that can be used to load additional data
  /// asynchronously.
  StaticGrid.sliver({
    Key? key,
    this.columnCount = 2,
    this.gap,
    this.padding,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.rowCrossAxisAlignment = CrossAxisAlignment.center,
    required Widget Function(BuildContext, int)? itemBuilder,
    required int? itemCount,
    int? Function(Key)? findChildIndexCallback,
    bool? addAutomaticKeepAlives = true,
    bool? addRepaintBoundaries = true,
    FutureOr<void> Function()? onLoadData,
  })  : _onLoadData = onLoadData,
        _addRepaintBoundaries = addRepaintBoundaries,
        _addAutomaticKeepAlives = addAutomaticKeepAlives,
        _findChildIndexCallback = findChildIndexCallback,
        _itemCount = itemCount,
        _itemBuilder = itemBuilder,
        _isSliver = true,
        super(key: key);

  /// The number of columns in the grid.
  final int columnCount;

  /// The spacing between cells.
  final double? gap;

  /// The padding around the grid.
  final EdgeInsets? padding;

  /// The main axis alignment for columns.
  MainAxisAlignment? _columnMainAxisAlignment;

  /// The cross axis alignment for columns.
  CrossAxisAlignment? _columnCrossAxisAlignment;

  /// The main axis alignment for rows.
  final MainAxisAlignment rowMainAxisAlignment;

  /// The cross axis alignment for rows.
  final CrossAxisAlignment rowCrossAxisAlignment;

  /// Whether the grid should expand to fill the available vertical space.
  bool? _expanded;

  /// The list of children to be arranged in the grid.
  List<Widget>? _children;

  /// The builder function for generating widgets dynamically.
  Widget Function(BuildContext ontext, int index)? _itemBuilder;

  /// The total number of items in the grid.
  int? _itemCount;

  /// The function to find the index of a child widget based on its `Key`.
  int? Function(Key)? _findChildIndexCallback;

  /// Whether to add automatic keep alives for sliver children.
  bool? _addAutomaticKeepAlives;

  /// Whether to add repaint boundaries for sliver children.
  bool? _addRepaintBoundaries;

  /// Whether the widget is used with the builder pattern.
  bool _isBuilder = false;

  /// Whether the widget is used as a sliver.
  bool _isSliver = false;

  /// The function to load additional data asynchronously.
  FutureOr<void> Function()? _onLoadData;

  @override
  State<StaticGrid> createState() => _StaticGridState();
}

class _StaticGridState extends State<StaticGrid> {
  bool _isLoading = false;

  Future<void> _onLoadData() async {
    if (_isLoading) {
      return;
    }

    _isLoading = true;
    await widget._onLoadData?.call();
    _isLoading = false;
  }

  Widget _createRow({
    required int rowIndex,
    required int rowCount,
    required int itemCount,
    required Function(BuildContext ontext, int index) itemBuilder,
  }) {
    if (widget._onLoadData != null && rowIndex == rowCount - 1) {
      _onLoadData();
      return const ListTile(title: Center(child: CircularProgressIndicator()));
    }

    final children = <Widget>[];
    children.add(
      Row(
        crossAxisAlignment: widget.rowCrossAxisAlignment,
        mainAxisAlignment: widget.rowMainAxisAlignment,
        children: _createCells(
          rowIndex: rowIndex,
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        ),
      ),
    );

    if (rowIndex != rowCount - 1) {
      children.add(SizedBox(height: widget.gap));
    }

    final column = Column(children: children);
    return (widget._expanded ?? false) ? Expanded(child: column) : column;
  }

  List<Widget> _createCells({
    required int rowIndex,
    required int itemCount,
    required Function(BuildContext ontext, int index) itemBuilder,
  }) {
    final List<Widget> columns = [];
    final childrenLength = itemCount;

    for (int columnIndex = 0; columnIndex < widget.columnCount; columnIndex++) {
      final cellIndex = rowIndex * widget.columnCount + columnIndex;
      if (cellIndex <= childrenLength - 1) {
        columns.add(
          Expanded(
            child: Builder(
              builder: (context) => itemBuilder(context, cellIndex),
            ),
          ),
        );
      } else {
        columns.add(Expanded(child: Container()));
      }

      if (columnIndex != widget.columnCount - 1) {
        columns.add(SizedBox(width: widget.gap));
      }
    }

    return columns;
  }

  @override
  Widget build(BuildContext context) {
    if (widget._isBuilder) {
      final rowCount = (widget._itemCount! / widget.columnCount).ceil() +
          (widget._onLoadData != null ? 1 : 0);

      return ListView.builder(
        padding: widget.padding,
        itemBuilder: (context, index) => _createRow(
          rowIndex: index,
          itemCount: widget._itemCount!,
          rowCount: rowCount,
          itemBuilder: widget._itemBuilder!,
        ),
        itemCount: rowCount,
      );
    }

    if (widget._isSliver) {
      final rowCount = (widget._itemCount! / widget.columnCount).ceil() +
          (widget._onLoadData != null ? 1 : 0);

      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => _createRow(
            rowIndex: index,
            itemCount: widget._itemCount!,
            rowCount: rowCount,
            itemBuilder: widget._itemBuilder!,
          ),
          childCount: rowCount,
          findChildIndexCallback: widget._findChildIndexCallback,
          addAutomaticKeepAlives: widget._addAutomaticKeepAlives!,
          addRepaintBoundaries: widget._addRepaintBoundaries!,
        ),
      );
    }

    final rowCount = (widget._children!.length / widget.columnCount).ceil();
    return Container(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: widget._columnCrossAxisAlignment!,
        mainAxisAlignment: widget._columnMainAxisAlignment!,
        children: List.generate(
          rowCount,
          (index) => _createRow(
            rowIndex: index,
            itemCount: widget._children!.length,
            rowCount: rowCount,
            itemBuilder: (context, index) => widget._children![index],
          ),
        ),
      ),
    );
  }
}
