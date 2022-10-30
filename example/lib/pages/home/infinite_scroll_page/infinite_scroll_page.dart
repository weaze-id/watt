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

  Future<void> _onLoad(int index) async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() => _itemCount += 25);

    if (_itemCount == 100) {
      setState(() => _enableLoad = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Infinite scroll")),
      body: InfiniteScroll(
        itemCount: _itemCount,
        enableLoad: _enableLoad,
        onLoad: (index) => _onLoad(index),
        itemBuilder: (context, index) => ListTile(
          title: Text("Item ${index + 1}"),
        ),
      ),
    );
  }
}
