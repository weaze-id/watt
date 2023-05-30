import 'dart:async';

import 'package:flutter/material.dart';

/// A widget that implements infinite scrolling behavior in a list.
///
/// The `InfiniteScroll` widget can be used to create a list that loads more
/// data dynamically as the user scrolls to the end of the list. It provides
/// options for different scrolling behaviors and configurations.
///
/// The `InfiniteScroll` widget can be used in different ways:
///   - `InfiniteScroll`: Basic infinite scroll behavior with a regular list.
///   - `InfiniteScroll.separated`: Infinite scroll behavior with a list
///     separated by a specified separator widget.
///   - `InfiniteScroll.sliver`: Infinite scroll behavior with a sliver list.
///   - `InfiniteScroll.sliverSeparated`: Infinite scroll behavior with a
///     sliver list separated by a specified separator widget.
///
/// The `itemCount` parameter defines the number of items in the list. The
/// `onLoadData` parameter is a callback function that is called when the list
/// needs to load more data. The `itemBuilder` parameter is a callback function
/// that builds each item in the list based on its index.
///
/// Example usage:
/// ```dart
/// InfiniteScroll(
///   itemCount: itemCount,
///   onLoadData: () {
///     // Load more data here
///   },
///   itemBuilder: (context, index) {
///     // Build each item here
///   },
/// )
/// ```
// ignore: must_be_immutable
class InfiniteScroll extends StatefulWidget {
  /// Creates an `InfiniteScroll` widget.
  ///
  /// The [itemCount] parameter is required and defines the number of items
  /// in the list. The [onLoadData] parameter is a callback function that is
  /// called when the list needs to load more data. The [itemBuilder]
  /// parameter is a callback function that builds each item in the list
  /// based on its index.
  ///
  /// Other optional parameters can be used to customize the behavior and
  /// appearance of the list, such as [primary], [cacheExtent],
  /// [keyboardDismissBehavior], [scrollDirection], [reverse], [controller],
  /// [physics], and [padding].
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

  /// Creates an `InfiniteScroll` widget with a separator.
  ///
  /// This constructor is used when you want to separate each item in the
  /// list with a specified separator widget. The parameters are similar to
  /// the basic `InfiniteScroll` constructor, with an additional
  /// [separatorBuilder] parameter that is a callback function responsible
  /// for building the separator widget for each item.
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

  /// Creates an `InfiniteScroll` widget with a sliver list.
  ///

  /// This constructor is used when you want to create a sliver list with
  /// infinite scroll behavior. The parameters are similar to the basic
  /// `InfiniteScroll` constructor, with additional parameters for sliver
  /// behavior such as [findChildIndexCallback], [addAutomaticKeepAlives],
  /// and [addRepaintBoundaries].
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

  /// Creates an `InfiniteScroll` widget with a separated sliver list.
  ///
  /// This constructor is used when you want to create a sliver list with
  /// infinite scroll behavior and a separator between each item. The
  /// parameters are similar to the basic `InfiniteScroll` constructor, with
  /// additional parameters for sliver behavior and a separator widget.
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

  int? Function(Key)? _findChildIndexCallback;
  bool? _addAutomaticKeepAlives;
  bool? _addRepaintBoundaries;
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
