import 'dart:async';

import 'package:flutter/material.dart';

class InfiniteScroll extends StatefulWidget {
  const InfiniteScroll({
    Key? key,
    this.primary,
    this.cacheExtent,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.physics,
    this.padding,
    required this.enableLoad,
    required this.itemCount,
    required this.onLoad,
    required this.itemBuilder,
    this.separatorBuilder,
  }) : super(key: key);

  final bool? primary;
  final double? cacheExtent;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final bool enableLoad;
  final int itemCount;
  final FutureOr<void> Function(int index) onLoad;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;

  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {
  bool _isLoading = false;

  Future<void> _onLoad(int index) async {
    if (_isLoading) {
      return;
    }

    _isLoading = true;
    await widget.onLoad(index);
    _isLoading = false;
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index == widget.itemCount && widget.enableLoad) {
      _onLoad(index - 1);
      return const ListTile(title: Center(child: CircularProgressIndicator()));
    }

    return widget.itemBuilder(context, index);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.separatorBuilder != null) {
      return ListView.separated(
        primary: widget.primary,
        cacheExtent: widget.cacheExtent,
        keyboardDismissBehavior: widget.keyboardDismissBehavior,
        scrollDirection: widget.scrollDirection,
        reverse: widget.reverse,
        controller: widget.controller,
        physics: widget.physics,
        padding: widget.padding,
        itemBuilder: _itemBuilder,
        itemCount: widget.enableLoad ? widget.itemCount + 1 : widget.itemCount,
        separatorBuilder: widget.separatorBuilder!,
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
      itemBuilder: _itemBuilder,
      itemCount: widget.enableLoad ? widget.itemCount + 1 : widget.itemCount,
    );
  }
}
