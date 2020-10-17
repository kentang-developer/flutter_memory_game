import 'package:flutter/material.dart';

class BoardItem extends StatefulWidget {
  String imagePath;

  BoardItem({this.imagePath});

  @override
  _BoardItemState createState() => _BoardItemState();
}

class _BoardItemState extends State<BoardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Container(
        color: Colors.white,
        child: Image.asset(widget.imagePath),
      ),
    );
  }
}
