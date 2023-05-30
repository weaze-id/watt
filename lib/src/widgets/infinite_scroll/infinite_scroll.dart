import 'dart:async';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InfiniteScroll extends StatefulWidget {
  InfiniteScroll({
    Key? key,
    this.primary,
    this.cacheExtent,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.physics,
    this.padding,
    required this.itemCount,
    required this.onLoadData,
    required this.itemBuilder,
  }) : super(key: key);

  InfiniteScroll.separated({
    Key? key,
    this.primary,
    this.cacheExtent,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.physics,
    this.padding,
    required this.itemCount,
    required this.onLoadData,
    required this.itemBuilder,
    required Widget Function(BuildContext, int)? separatorBuilder,
  })  : _separatorBuilder = separatorBuilder,
        _isSeparated = true,
        super(key: key);

  InfiniteScroll.sliver({
    Key? key,
    this.primary,
    this.cacheExtent,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.physics,
    this.padding,
    required this.itemCount,
    required this.onLoadData,
    required this.itemBuilder,
    int? Function(Key)? findChildIndexCallback,
    bool? addAutomaticKeepAlives = true,
    bool? addRepaintBoundaries = true,
  })  : _addRepaintBoundaries = addRepaintBoundaries,
        _addAutomaticKeepAlives = addAutomaticKeepAlives,
        _findChildIndexCallback = findChildIndexCallback,
        _isSliver = true,
        super(key: key);

  InfiniteScroll.sliverSeparated({
    Key? key,
    this.primary,
    this.cacheExtent,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.physics,
    this.padding,
    required this.itemCount,
    required this.onLoadData,
    required this.itemBuilder,
    required Widget Function(BuildContext, int)? separatorBuilder,
    int? Function(Key)? findChildIndexCallback,
    bool? addAutomaticKeepAlives = true,
    bool? addRepaintBoundaries = true,
  })  : _separatorBuilder = separatorBuilder,
        _addRepaintBoundaries = addRepaintBoundaries,
        _addAutomaticKeepAlives = addAutomaticKeepAlives,
        _findChildIndexCallback = findChildIndexCallback,
        _isSliver = true,
        _isSeparated = true,
        super(key: key);

  final bool? primary;
  final double? cacheExtent;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final int itemCount;
  final FutureOr<void> Function()? onLoadData;
  final Widget Function(BuildContext context, int index) itemBuilder;

  // Property for InfiniteScroll.sliver
  int? Function(Key)? _findChildIndexCallback;
  bool? _addAutomaticKeepAlives;
  bool? _addRepaintBoundaries;

  // Property for InfiniteScroll.separated and InfiniteScroll.sliverSeparated
  Widget Function(BuildContext context, int index)? _separatorBuilder;

  bool _isSeparated = false;
  bool _isSliver = false;

  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {
  bool _isLoading = false;

  Future<void> _onLoadData() async {
    if (_isLoading) {
      return;
    }

    _isLoading = true;
    await widget.onLoadData?.call();
    _isLoading = false;
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    if (index == widget.itemCount && widget.onLoadData != null) {
      _onLoadData();
      return const ListTile(title: Center(child: CircularProgressIndicator()));
    }

    return widget.itemBuilder(context, index);
  }

  Widget _sliverItemBuilder(BuildContext context, int index) {
    if (index == widget.itemCount && widget.onLoadData != null) {
      _onLoadData();
      return const ListTile(title: Center(child: CircularProgressIndicator()));
    }

    if (widget._isSeparated && index != widget.itemCount - 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.itemBuilder(context, index),
          widget._separatorBuilder!(context, index),
        ],
      );
    }

    return widget.itemBuilder(context, index);
  }

  @override
  Widget build(BuildContext context) {
    if (widget._isSliver) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          _sliverItemBuilder,
          childCount: widget.onLoadData != null
              ? widget.itemCount + 1
              : widget.itemCount,
          findChildIndexCallback: widget._findChildIndexCallback,
          addAutomaticKeepAlives: widget._addAutomaticKeepAlives!,
          addRepaintBoundaries: widget._addRepaintBoundaries!,
        ),
      );
    }

    if (widget._isSeparated) {
      return ListView.separated(
        primary: widget.primary,
        cacheExtent: widget.cacheExtent,
        keyboardDismissBehavior: widget.keyboardDismissBehavior,
        scrollDirection: widget.scrollDirection,
        reverse: widget.reverse,
        controller: widget.controller,
        physics: widget.physics,
        padding: widget.padding,
        itemBuilder: _listItemBuilder,
        itemCount:
            widget.onLoadData != null ? widget.itemCount + 1 : widget.itemCount,
        separatorBuilder: widget._separatorBuilder!,
      );
    }

    return ListView.builder(
      primary: widget.primary,
      cacheExtent: widget.cacheExtent,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      controller: widget.controller,
      physics: widget.physics,
      padding: widget.padding,
      itemBuilder: _listItemBuilder,
      itemCount:
          widget.onLoadData != null ? widget.itemCount + 1 : widget.itemCount,
    );
  }
}
