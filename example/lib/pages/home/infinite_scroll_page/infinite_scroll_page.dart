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
    if (!mounted) {
      return;
    }

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
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(title: Text("Hwllo World")),
          SliverToBoxAdapter(
            child: StaticGrid(children: [
              ElevatedButton(onPressed: () {}, child: Text("Hello")),
              ElevatedButton(onPressed: () {}, child: Text("Hello")),
              ElevatedButton(onPressed: () {}, child: Text("Hello")),
              ElevatedButton(onPressed: () {}, child: Text("Hello")),
              ElevatedButton(onPressed: () {}, child: Text("Hello")),
            ]),
          ),
          SliverInfiniteScroll(
            enableLoad: _enableLoad,
            itemCount: _itemCount,
            onLoad: _onLoad,
            itemBuilder: (context, index) => ListTile(
              title: Text(index.toString()),
            ),
          )
        ],
      ),
    );
  }
}
