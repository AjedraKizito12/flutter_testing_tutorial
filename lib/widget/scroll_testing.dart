import 'package:flutter/material.dart';

class ScrollTestingWidget extends StatefulWidget {
  final List<String> bookTitles;
  const ScrollTestingWidget({Key key, this.bookTitles}) : super(key: key);

  @override
  State<ScrollTestingWidget> createState() => _ScrollTestingWidgetState();
}

class _ScrollTestingWidgetState extends State<ScrollTestingWidget> {
  @override
  Widget build(BuildContext context) {
    assert(widget.bookTitles.isNotEmpty);
    return Scaffold(
      appBar: AppBar(title: Text("Bookshelf")),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(widget.bookTitles[index]),
        ),
        itemCount: widget.bookTitles.length,
      ),
    );
  }
}
