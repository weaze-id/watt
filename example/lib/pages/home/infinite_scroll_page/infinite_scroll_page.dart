import 'dart:async';

import 'package:flutter/material.dart';

import 'package:watt/watt.dart';

class InfiniteScrollPage extends StatefulWidget {
  const InfiniteScrollPage({Key? key}) : super(key: key);

  @override
  State<InfiniteScrollPage> createState() => _InfiniteScrollPageState();
}

class _InfiniteScrollPageState extends State<InfiniteScrollPage> {
  int _itemCount = 0;
  bool _enableLoad = true;

  Future<void> _onLoadData() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() => _itemCount += 10);

      if (_itemCount == 100) {
        setState(() => _enableLoad = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Infinite scroll"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "List"),
              Tab(text: "Grid"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _InfiniteList(
              enableLoad: _enableLoad,
              itemCount: _itemCount,
              onLoadData: _onLoadData,
            ),
            _InfiniteGridList(
              enableLoad: _enableLoad,
              itemCount: _itemCount,
              onLoadData: _onLoadData,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfiniteList extends StatelessWidget {
  const _InfiniteList({
    Key? key,
    required this.enableLoad,
    required this.itemCount,
    required this.onLoadData,
  }) : super(key: key);

  final bool enableLoad;
  final int itemCount;
  final FutureOr<void> Function() onLoadData;

  @override
  Widget build(BuildContext context) {
    return InfiniteScroll(
      itemCount: itemCount,
      onLoadData: onLoadData,
      itemBuilder: (context, index) => ListTile(title: Text(index.toString())),
    );
  }
}

class _InfiniteGridList extends StatelessWidget {
  const _InfiniteGridList({
    Key? key,
    required this.enableLoad,
    required this.itemCount,
    required this.onLoadData,
  }) : super(key: key);

  final bool enableLoad;
  final int itemCount;
  final FutureOr<void> Function() onLoadData;

  @override
  Widget build(BuildContext context) {
    return StaticGrid.builder(
      itemCount: itemCount,
      onLoadData: onLoadData,
      itemBuilder: (context, index) => ListTile(title: Text(index.toString())),
    );
  }
}
