import 'dart:async';

import 'package:flutter/material.dart';

class SliverInfiniteScroll extends StatefulWidget {
  const SliverInfiniteScroll({
    Key? key,
    this.findChildIndexCallback,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    required this.enableLoad,
    required this.itemCount,
    required this.onLoad,
    required this.itemBuilder,
    this.separatorBuilder,
  }) : super(key: key);

  final int? Function(Key)? findChildIndexCallback;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool enableLoad;
  final int itemCount;
  final FutureOr<void> Function(int index) onLoad;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;

  @override
  State<SliverInfiniteScroll> createState() => _SliverInfiniteScrollState();
}

class _SliverInfiniteScrollState extends State<SliverInfiniteScroll> {
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

    if (widget.separatorBuilder != null && index != widget.itemCount - 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.itemBuilder(context, index),
          widget.separatorBuilder!(context, index),
        ],
      );
    }

    return widget.itemBuilder(context, index);
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        _itemBuilder,
        childCount: widget.enableLoad ? widget.itemCount + 1 : widget.itemCount,
        findChildIndexCallback: widget.findChildIndexCallback,
        addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
        addRepaintBoundaries: widget.addRepaintBoundaries,
      ),
    );
  }
}
