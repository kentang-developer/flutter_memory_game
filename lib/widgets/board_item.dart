import 'package:flutter/material.dart';
import 'package:flutter_memory_game/model/board_item_model.dart';

class BoardItem extends StatelessWidget {
  final BoardItemModel itemModel;
  final Function() onTap;

  BoardItem({this.itemModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onImageTap,
      child: Container(
        margin: EdgeInsets.all(5),
        child: Container(
          color: Colors.white,
          child: Image.asset(itemModel.isRevealed || itemModel.isCompleted
              ? itemModel.imagePath
              : "assets/question.webp"),
        ),
      ),
    );
  }

  void onImageTap() {
    onTap();
  }
}
