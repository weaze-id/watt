import 'dart:async';

import 'package:flutter/material.dart';

import 'grid_builder_util.dart';

// ignore: must_be_immutable
class StaticGrid extends StatefulWidget {
  StaticGrid({
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
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;

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

  // Property for StaticGrid
  List<Widget>? children;
  bool? expanded;
  MainAxisAlignment? columnMainAxisAlignment;
  CrossAxisAlignment? columnCrossAxisAlignment;

  // Property for StaticGrid.builder and StaticGrid.sliver
  Widget Function(BuildContext ontext, int index)? _itemBuilder;
  int? _itemCount;

  // Property for StaticGrid.sliver
  int? Function(Key)? _findChildIndexCallback;
  bool? _addAutomaticKeepAlives;
  bool? _addRepaintBoundaries;

  bool _isBuilder = false;
  bool _isSliver = false;
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

  @override
  Widget build(BuildContext context) {
    if (!widget._isBuilder && !widget._isSliver) {
      final rowCount = (widget.children!.length / widget.columnCount).ceil();
      return Container(
        padding: widget.padding,
        child: Column(
          crossAxisAlignment: widget.columnCrossAxisAlignment!,
          mainAxisAlignment: widget.columnMainAxisAlignment!,
          children: List.generate(
            rowCount,
            (index) => GridBuilderUtil.createRow(
              gap: widget.gap,
              rowIndex: index,
              itemCount: widget.children!.length,
              rowCount: rowCount,
              columnCount: widget.columnCount,
              rowMainAxisAlignment: widget.rowMainAxisAlignment,
              rowCrossAxisAlignment: widget.rowCrossAxisAlignment,
              builder: (context, index) => widget.children![index],
            ),
          ),
        ),
      );
    }

    if (widget._isBuilder) {
      final rowCount = (widget._itemCount! / widget.columnCount).ceil() +
          (widget._onLoadData != null ? 1 : 0);

      return ListView.builder(
        padding: widget.padding,
        itemBuilder: (context, index) => GridBuilderUtil.createRow(
          gap: widget.gap,
          rowIndex: index,
          itemCount: widget._itemCount!,
          rowCount: rowCount,
          columnCount: widget.columnCount,
          rowMainAxisAlignment: widget.rowMainAxisAlignment,
          rowCrossAxisAlignment: widget.rowCrossAxisAlignment,
          builder: widget._itemBuilder!,
          onLoadData: widget._onLoadData != null ? _onLoadData : null,
        ),
        itemCount: rowCount,
      );
    }

    if (widget._isSliver) {
      final rowCount = (widget._itemCount! / widget.columnCount).ceil() +
          (widget._onLoadData != null ? 1 : 0);

      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => GridBuilderUtil.createRow(
            gap: widget.gap,
            rowIndex: index,
            itemCount: widget._itemCount!,
            rowCount: rowCount,
            columnCount: widget.columnCount,
            rowMainAxisAlignment: widget.rowMainAxisAlignment,
            rowCrossAxisAlignment: widget.rowCrossAxisAlignment,
            builder: widget._itemBuilder!,
            onLoadData: widget._onLoadData != null ? _onLoadData : null,
          ),
          childCount: rowCount,
          findChildIndexCallback: widget._findChildIndexCallback,
          addAutomaticKeepAlives: widget._addAutomaticKeepAlives!,
          addRepaintBoundaries: widget._addRepaintBoundaries!,
        ),
      );
    }

    return const SizedBox();
  }
}
